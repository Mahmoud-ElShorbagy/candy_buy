part of 'cubit.dart';

@immutable
sealed class RegisterState extends Equatable {}

final class SignupInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends RegisterState {
  final String message;
  @override
  List<Object?> get props => [message];
  AuthErrorState({required this.message});
}

class RegisterFailure extends RegisterState {
  final String message;
  @override
  List<Object?> get props => [message];
  RegisterFailure({required this.message});
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}
