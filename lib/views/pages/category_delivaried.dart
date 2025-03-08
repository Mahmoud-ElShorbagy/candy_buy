import 'package:candy_buy/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import '../../widgets/custom_image.dart';

class CategoryDelivared extends StatelessWidget {
  const CategoryDelivared({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 69),
        child: const Center(child: CustomLogoSvg()),
      ),
      Container(
        margin: EdgeInsets.only(top: 83, left: 28, right: 27, bottom: 61.31),
        child: const CustomImageWidget(
            imagePath: "assets/images/Onboarding/bagca.svg",
            width: 320,
            height: 244),
      ),
      const AppText(
        text: "Quick delivery, full customer chat and 24x7 restaurant support.",
        textBold: "Enjoy Your Orders",
      ),
    ]);
  }
}
