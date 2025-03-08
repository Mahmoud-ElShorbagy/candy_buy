// ignore_for_file: must_be_immutable

part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductSuccess extends ProductState {
  bool isSnackBarShow = false;
  final String message;
  ProductSuccess(this.message);
}

class ProductPriceUpdated extends ProductState {
  final int totalPrice;
  final int count;
  ProductPriceUpdated(this.totalPrice, this.count);
}
