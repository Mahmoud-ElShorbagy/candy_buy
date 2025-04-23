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

// ignore: must_be_immutable
final class FavoritesItemUpdated extends FavoritesItemState {
  final List<bool> isShowSnackBar;
  final List<CategorytDTO> favorites;
  final String message;
  @override
  List<Object> get props => [message, isShowSnackBar, favorites];
  const FavoritesItemUpdated(
      {required this.isShowSnackBar,
      required this.favorites,
      required this.message});
}
