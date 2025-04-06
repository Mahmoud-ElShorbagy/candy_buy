import 'package:candy_buy/controllers/database_controller.dart';
import 'package:candy_buy/models/user_data.dart';
import 'package:candy_buy/services/auth.dart';
import 'package:candy_buy/utilities/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Database database = FireStoreDatabase(uid: "123");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final AuthBase authBase = Auth();
  PageController? pageController;
  RegisterCubit() : super(PasswordHidden());
  final FirebaseAuth auth = FirebaseAuth.instance;
  static RegisterCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void togglePasswordVisibility() {
    if (state is PasswordHidden) {
      emit(PasswordVisible());
    } else {
      emit(PasswordHidden());
    }
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      await Future.delayed(Duration(seconds: 1));
      try {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await database.setUserData(UserData(
            uid: documnentIdFromLocalData(), email: emailController.text));
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        emit(RegisterSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('The password provided is too weak.');
          emit(AuthErrorState(message: "The password provided is too weak."));
        } else if (e.code == 'email-already-in-use') {
          debugPrint('The account already exists for that email.');
          emit(AuthErrorState(
              message:
                  "The account already exists for that email. please go back and enter a new email."));
        } else {
          emit(RegisterFailure(message: e.toString()));
        }
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
