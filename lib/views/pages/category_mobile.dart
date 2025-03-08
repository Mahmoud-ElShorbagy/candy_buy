import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';

class CategoryMobile extends StatelessWidget {
  const CategoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 69, left: 108, right: 107),
        child: const Center(
          child: CustomLogoSvg(),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 78, left: 27, right: 27.5, bottom: 51),
        child: CustomImageWidget(
            imagePath: "assets/images/Onboarding/ca.svg",
            width: 265,
            height: 259),
      ),
      const AppText(
        text:
            "Book from the comfort of your home, office or anywhere, on any device.",
        textBold: "Book From Your Mobile",
      ),
    ]);
  }
}
