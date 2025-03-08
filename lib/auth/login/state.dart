part of 'cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess({required this.message});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

class SendVerification extends LoginState {
  final String message;

  SendVerification({required this.message});
}
