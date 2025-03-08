import 'package:candy_buy/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthBase authBase = Auth();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 1));
      try {
        await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (auth.currentUser!.emailVerified) {
          emit(LoginSuccess(message: "Login. Welcome To gate Candy"));
        } else {
          emit(SendVerification(
              message: "Please check your email to verify your account"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginError(message: "No user found for that email."));
        } else if (e.code == 'wrong-password') {
          emit(LoginError(message: 'Wrong password provided for that user.'));
        } else {
          emit(LoginFailure(message: e.toString()));
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
