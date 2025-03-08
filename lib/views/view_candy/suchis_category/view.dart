import 'package:candy_buy/widgets/app/custom_category_product.dart';
import 'package:flutter/material.dart';
import '../sushi_page/view.dart';

class SuchisCategoryView extends StatelessWidget {
  const SuchisCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCategoryProduct(
      title: "Suchis",
      titleCart: "Unicorn Suchis",
      contentCart: "The world famous Suchis",
      subContentCart: "suchis at your place",
      imageCart: "assets/images/view/sweetsuchi.svg",
      child: SuchisPageView(),
    );
  }
}
