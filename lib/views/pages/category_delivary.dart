import 'package:flutter/material.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';

class CategoryDelivary extends StatelessWidget {
  const CategoryDelivary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
          margin: const EdgeInsets.only(top: 69),
          child: const Center(
            child: CustomLogoSvg(),
          )),
      Container(
        margin: EdgeInsets.only(top: 67, left: 80.58, right: 79.4, bottom: 40),
        child: const CustomImageWidget(
            imagePath: "assets/images/Onboarding/bike.svg",
            width: 215,
            height: 281),
      ),
      const AppText(
        text:
            "Our delivery agent, gets ready on his bike to quickly deliver the order.",
        textBold: "Really Quick Devlivery",
      ),
    ]);
  }
}
