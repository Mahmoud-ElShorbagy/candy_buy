part of 'cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgetpasswordLoading extends ForgetpasswordState {}

class ForgetpasswordSuccess extends ForgetpasswordState {
  final String message;
  ForgetpasswordSuccess({required this.message});
}

class ForgetpasswordError extends ForgetpasswordState {
  final String message;
  ForgetpasswordError({required this.message});
}
