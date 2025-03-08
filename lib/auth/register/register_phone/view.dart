import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/validators.dart';
import '../../../core/route_utils/route_names.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_logo.dart';
import '../../../widgets/custom_textform.dart';

class RegisterMobileView extends StatefulWidget {
  const RegisterMobileView({super.key});

  @override
  State<RegisterMobileView> createState() => _RegisterMobileViewState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _RegisterMobileViewState extends State<RegisterMobileView> {
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
                textBold: "And Your Mobile",
                text:
                    "Share your number with us, but we don’t share it with anyone else"),
            const SizedBox(
              height: 56,
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomTextField(
                  validator: (v) {
                    return Validators.phone(v);
                  },
                  hint: 'Phone Number',
                  image: "assets/images/icons/mobile.jpg",
                ),
              ),
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 69, bottom: 16),
                child: CustomButton(
                    text: "Next",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RouteNames.receivecode);
                      }
                    })),
            CustomTextRich(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.register);
              },
              text: "Go back",
            ),
          ],
        ));
  }
}
