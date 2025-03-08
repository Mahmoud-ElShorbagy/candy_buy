import 'package:flutter/material.dart';

import '../../../models/donut_variables.dart';
import '../../../widgets/app/custom_cart_item.dart';

class CartProductView extends StatelessWidget {
  const CartProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCartItem(
      products: productDonut,
    );
  }
}
