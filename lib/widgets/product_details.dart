import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/widgets.dart';

import 'app_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: title,
              fontWeight: FontWeight.w700,
              color: AppColors.textProductColor,
              fontSize: 16),
          CustomText(
              text: "\$$price x1",
              fontWeight: FontWeight.w800,
              color: AppColors.textProductColor,
              fontSize: 14),
        ]);
  }
}
