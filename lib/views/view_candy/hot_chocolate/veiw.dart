import 'package:candy_buy/views/view_candy/hot_chocolate_page/veiw.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app/custom_category_product.dart';

class HotChocolateCategoryView extends StatelessWidget {
  const HotChocolateCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCategoryProduct(
      title: "Hot Chocolate",
      titleCart: " Hot Chocolate",
      contentCart: "The world famous Candy",
      subContentCart: "candy at your place",
      imageCart: "assets/images/hot_chocolate/hc.png",
      child: HotChocolatePageView(),
    );
  }
}
