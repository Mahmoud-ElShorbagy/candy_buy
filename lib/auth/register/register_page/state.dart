part of 'cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterLoading extends RegisterState {}

final class AuthErrorState extends RegisterState {
  final String message;

  AuthErrorState({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});
}

final class RegisterSuccess extends RegisterState {}

final class PasswordHidden extends RegisterState {
  PasswordHidden();
}

final class PasswordVisible extends RegisterState {
  PasswordVisible();
}

final class StateUpdate extends RegisterState {}
