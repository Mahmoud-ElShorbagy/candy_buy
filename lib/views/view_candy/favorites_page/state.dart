part of 'cubit.dart';

sealed class FavoritesItemState extends Equatable {
  const FavoritesItemState();

  @override
  List<Object> get props => [];
}

final class FavoritesItemInitial extends FavoritesItemState {}

// ignore: must_be_immutable
final class FavoritesItemSuccess extends FavoritesItemState {
  bool isShowSnackBar = false;
  final String message;
  @override
  List<Object> get props => [message, isShowSnackBar];
  FavoritesItemSuccess(this.message);
}
