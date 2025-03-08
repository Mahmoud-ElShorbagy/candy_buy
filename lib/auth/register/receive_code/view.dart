import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/route_utils/route_names.dart';
import '../../../views/view_candy/otp/view.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_logo.dart';

class ReceiveCodeView extends StatelessWidget {
  const ReceiveCodeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(
                  top: 69,
                ),
                child: const CustomLogoSvg()),
            Container(
              margin: const EdgeInsets.only(
                  top: 47, left: 111, right: 102.34, bottom: 21.08),
              child: const CustomImageWidget(
                  imagePath: "assets/images/login/Group.svg",
                  width: 162,
                  height: 174),
            ),
            const AppText(
                textBold: "One Last Step",
                text:
                    "Enter the four secret digits we just send to the given mobile number."),
            const SizedBox(
              height: 32,
            ),
            const OtpView(),
            const SizedBox(
              height: 24,
            ),
            Center(
                child: CustomTextRich(
                    onTap: () {}, text: "Didn’t Receive? ", textTap: "Resend")),
            Container(
                margin: const EdgeInsets.only(top: 57, bottom: 16),
                child: CustomButton(
                    text: "Next",
                    onPressed: () async {
                      Navigator.pushNamed(context, RouteNames.candygate);
                    })),
            Center(
              child: CustomTextRich(
                onTap: () {
                  RouteUtils.goBack(context);
                },
                text: "Go back",
              ),
            ),
          ],
        ));
  }
}
