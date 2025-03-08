import 'package:flutter/widgets.dart';

import '../../../widgets/app/custom_category_product.dart';
import '../cake_page/cake_page.dart';

class CakeCategoryView extends StatelessWidget {
  const CakeCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCategoryProduct(
      title: "Creamy Cakes",
      titleCart: "Cub Cream Cake",
      contentCart: "The world famous Cakes",
      subContentCart: "Cakes at your place",
      imageCart: "assets/images/view/creamCake.svg",
      child: CakePageView(),
    );
  }
}
