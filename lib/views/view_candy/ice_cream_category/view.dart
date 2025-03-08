import 'package:candy_buy/views/view_candy/ice_cream_page/view.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app/custom_category_product.dart';

class IceCreamCategoryView extends StatelessWidget {
  const IceCreamCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCategoryProduct(
      title: "Ice Cream",
      titleCart: "Ice Cream Cold",
      contentCart: "The world famous Candy",
      subContentCart: "candy at your place",
      imageCart: "assets/images/view/shakesrages.svg",
      child: ICeCreamPageView(),
    );
  }
}
