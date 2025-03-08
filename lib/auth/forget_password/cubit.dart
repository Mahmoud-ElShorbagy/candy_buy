import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  ForgetpasswordCubit() : super(ForgetpasswordInitial());
  static ForgetpasswordCubit get(context) => BlocProvider.of(context);

  void forgetPassword() async {
    try {
      emit(ForgetpasswordLoading());
      await Future.delayed(Duration(seconds: 1));
      if (emailController.text.isEmpty) {
        emit(ForgetpasswordError(message: "Please enter your email"));
        return;
      }
      await auth.sendPasswordResetEmail(email: emailController.text);
      if (!isClosed) {
        emit(ForgetpasswordSuccess(
            message: "Please check your message to reset password"));
      }
    } catch (e) {
      if (!isClosed) {
        emit(ForgetpasswordError(message: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
