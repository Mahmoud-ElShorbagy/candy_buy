import 'package:candy_buy/auth/register/register_page/cubit.dart';
import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/route_utils/route_names.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_logo.dart';
import '../../../widgets/custom_textform.dart';

class RegisterNameView extends StatefulWidget {
  const RegisterNameView({super.key});

  @override
  State<RegisterNameView> createState() => _RegisterNameViewState();
}

class _RegisterNameViewState extends State<RegisterNameView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: ListView(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 69, bottom: 58),
                      child: const CustomLogoSvg()),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 114, right: 113.25, bottom: 25.08),
                    child: const CustomImageWidget(
                        imagePath: "assets/images/login/Layer2.svg",
                        width: 148,
                        height: 174),
                  ),
                  AppText(
                      textBold: "Welcome to Doki Doki.",
                      text:
                          "Let’s start with the basic details. First things first, what sould we call you"),
                  const SizedBox(height: 50),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: CustomTextField(
                        controller: cubit.nameController,
                        onChanged: (v) {
                          cubit.nameController.text = v;
                        },
                        validator: (v) {
                          return Validators.name(v);
                        },
                        hint: 'Full Name',
                        image: "assets/images/icons/profile.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 69,
                  ),
                  CustomButton(
                      text: "Next",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await cubit.saveName();
                          Navigator.pushNamed(context, RouteNames.register,
                              arguments: cubit.nameController.text);
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextRich(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                      text: "Already registered? ",
                      textTap: "Login"),
                ],
              ));
        },
      ),
    );
  }
}
