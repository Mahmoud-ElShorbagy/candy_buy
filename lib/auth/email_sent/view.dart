import 'package:candy_buy/auth/forget_password/cubit.dart';
import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/route_utils/route_names.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';

class EmailSentView extends StatelessWidget {
  const EmailSentView({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
        create: (context) => ForgetpasswordCubit(),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 69),
                child: const CustomLogoSvg(),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 92, left: 112, right: 110, bottom: 21.08),
                child: const CustomImageWidget(
                    imagePath: "assets/images/login/Layer4.svg",
                    height: 174,
                    width: 153),
              ),
              AppText(
                  textBold: "Email Sent",
                  text:
                      "We’ve sent a password reset link to $email . Please check the spam folder also :)"),
              Container(
                  margin: const EdgeInsets.only(top: 164, bottom: 16),
                  child: CustomButton(
                      text: "Back to login",
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteNames.login);
                      })),
              CustomText(
                  text: "Contact Us",
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimaryColor,
                  fontSize: 16),
              const SizedBox(
                height: 82,
              )
            ],
          ),
        ));
  }
}
