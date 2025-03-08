import 'package:flutter/widgets.dart';

import '../../../widgets/app/custom_category_product.dart';
import '../candy_fair_page/veiw.dart';

class CandyFairCategoryView extends StatelessWidget {
  const CandyFairCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCategoryProduct(
      title: "The Candy Fair",
      titleCart: "Candy Commander",
      contentCart: "The world famous Candy",
      subContentCart: "candy at your place",
      imageCart: "assets/images/candy/qr.png",
      width: 400,
      child: CandyFairPageView(),
    );
  }
}
