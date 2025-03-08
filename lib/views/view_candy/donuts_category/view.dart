import 'package:candy_buy/widgets/app/custom_category_product.dart';
import 'package:flutter/material.dart';
import '../donuts_page/view.dart';

class DonutsCategoryView extends StatelessWidget {
  const DonutsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCategoryProduct(
      title: "Donuts",
      titleCart: "Unicorn Donuts",
      contentCart: "The world famous unicorn",
      subContentCart: "donuts at your place",
      imageCart: "assets/images/view/unicorn.svg",
      child: DonutsPageView(),
    );
  }
}
