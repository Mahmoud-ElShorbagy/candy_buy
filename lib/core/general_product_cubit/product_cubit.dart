import 'package:candy_buy/models/product_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app/custom_cart_item.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({this.initialPrice = 0}) : super(ProductInitial());
  static ProductCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  final int initialPrice;
  int count = 0;
  int get totalPrice => count * initialPrice;

  void increment() {
    count++;

    emit(ProductPriceUpdated(count, totalPrice));
  }

  void decrement() {
    if (count > 0) {
      count--;

      emit(ProductPriceUpdated(count, totalPrice));
    }
  }

  void addProduct(ProductDTO productDTO) {
    if (!product.contains(productDTO)) {
      product.add(productDTO);
      emit(ProductSuccess("Product Successfully Added"));
    } else {
      emit(ProductSuccess("Product Already Added !"));
    }
  }
}
