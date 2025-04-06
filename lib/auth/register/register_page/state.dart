part of 'cubit.dart';

@immutable
sealed class RegisterState extends Equatable {}

final class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class AuthErrorState extends RegisterState {
  final String message;
  @override
  List<Object?> get props => [message];
  AuthErrorState({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String message;
  @override
  List<Object?> get props => [message];
  RegisterFailure({required this.message});
}

final class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class PasswordHidden extends RegisterState {
  @override
  List<Object?> get props => [];
  PasswordHidden();
}

final class PasswordVisible extends RegisterState {
  @override
  List<Object?> get props => [];
  PasswordVisible();
}
