import 'package:candy_buy/views/view_candy/chocolate_page/veiw.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app/custom_category_product.dart';

class ChocolateCategoryView extends StatelessWidget {
  const ChocolateCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCategoryProduct(
      title: "Chocolate Lap",
      titleCart: "Express Chocolate",
      contentCart: "The world famous Candy",
      subContentCart: "candy at your place",
      imageCart: "assets/images/chocolate_lab/candy_chocolate.png",
      width: 400,
      child: ChocolatePageView(),
    );
  }
}
