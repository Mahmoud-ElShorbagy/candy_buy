import '../../../core/helpers/app_colors.dart';
import '../../../core/route_utils/route_names.dart';
import 'package:flutter/material.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_logo.dart';

class CandyGate extends StatelessWidget {
  const CandyGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 69, bottom: 92),
                child: const CustomLogoSvg()),
            Container(
              margin: const EdgeInsets.only(
                  bottom: 29.08, left: 105, right: 104.74),
              child: const CustomImageWidget(
                imagePath: "assets/images/rigester/Layer3.svg",
                width: 165,
                height: 174,
              ),
            ),
            const AppText(
                textBold: "All Done",
                text:
                    "You’re now ready to explore the magical world of Doki Doki. Tasty candies are waiting inside."),
            Container(
                margin: const EdgeInsets.only(top: 170, bottom: 56),
                width: double.infinity,
                child: CustomButton(
                    text: "Let’s go",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteNames.login);
                    }))
          ],
        ));
  }
}
