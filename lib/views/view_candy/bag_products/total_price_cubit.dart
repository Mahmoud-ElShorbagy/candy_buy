import 'package:candy_buy/core/general_product_cubit/product_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'total_price_state.dart';

class TotalPriceCubit extends Cubit<int> {
  TotalPriceCubit() : super(0);
  bool isDiscountApplied = false;
  static TotalPriceCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void updateTotalPrice(List<ProductCubit> productCubits, int shippingFee) {
    int total = 0;
    for (var cubit in productCubits) {
      total += cubit.totalPrice;
    }
    emit(total + shippingFee);
  }

  void applyDiscount(int totalPrice) {
    final discountedPrice = totalPrice * 0.5;
    isDiscountApplied = true;
    emit(discountedPrice.toInt());
  }

  void resetDiscount(int originalPrice) {
    emit(originalPrice);
  }
}
