part of 'cubit.dart';

@immutable
sealed class LoginState extends Equatable {}

final class PasswordHidden extends LoginState {
  @override
  List<Object?> get props => [];
}

final class PasswordVisible extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final String message;
  @override
  List<Object?> get props => [message];
  LoginSuccess({required this.message});
}

class LoginError extends LoginState {
  final String message;
  @override
  List<Object?> get props => [message];
  LoginError({required this.message});
}

class LoginFailure extends LoginState {
  final String message;
  @override
  List<Object?> get props => [message];
  LoginFailure({required this.message});
}

class SendVerification extends LoginState {
  final String message;
  @override
  List<Object?> get props => [message];
  SendVerification({required this.message});
}
