part of 'cubit.dart';

@immutable
sealed class ForgetpasswordState extends Equatable {}

final class ForgetpasswordInitial extends ForgetpasswordState {
  @override
  List<Object?> get props => [];
}

class ForgetpasswordLoading extends ForgetpasswordState {
  @override
  List<Object?> get props => [];
}

class ForgetpasswordSuccess extends ForgetpasswordState {
  final String message;
  ForgetpasswordSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ForgetpasswordError extends ForgetpasswordState {
  final String message;
  ForgetpasswordError({required this.message});

  @override
  List<Object?> get props => [message];
}
