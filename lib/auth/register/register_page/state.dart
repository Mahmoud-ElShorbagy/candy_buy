part of 'cubit.dart';

@immutable
sealed class RegisterState {}

final class SignupInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class AuthErrorState extends RegisterState {
  final String message;

  AuthErrorState({required this.message});
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});
}

class RegisterSuccess extends RegisterState {}
