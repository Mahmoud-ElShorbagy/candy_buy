// ignore_for_file: must_be_immutable

part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState {
  bool isSnackBarShow = false;
  final String message;
  ProductSuccess(this.message);

  @override
  List<Object?> get props => [isSnackBarShow, message];
}

class ProductPriceUpdated extends ProductState {
  final int totalPrice;
  final int count;
  ProductPriceUpdated(this.totalPrice, this.count);

  @override
  List<Object?> get props => [totalPrice, count];
}
