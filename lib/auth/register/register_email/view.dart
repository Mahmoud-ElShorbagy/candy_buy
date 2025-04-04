import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/validators.dart';
import '../../../widgets/custom_logo.dart';
import '../register_page/cubit.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textform.dart';

class RegisterEmailView extends StatelessWidget {
  const RegisterEmailView({
    super.key,
    required this.pageController,
  });

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    final String nameController =
        ModalRoute.of(context)?.settings.arguments as String? ?? "User";
    return ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 58, top: 69),
            child: const CustomLogoSvg()),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 109, right: 108.35, bottom: 25.08),
              child: const CustomImageWidget(
                  imagePath: "assets/images/login/Layerbag.svg",
                  width: 158,
                  height: 174),
            ),
            AppText(
                textBold: "Hi $nameController.",
                text:
                    "You’ve got such a nice name. Now, let’s start with some important ones. I am noting these details in my diary")
          ],
        ),
        const SizedBox(
          height: 56,
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return Form(
              key: cubit.formKey2,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CustomTextField(
                      validator: (v) {
                        return Validators.email(v);
                      },
                      controller: cubit.emailController,
                      hint: 'Email Address',
                      image: 'assets/images/icons/email.png',
                    ),
                  ),
                  const SizedBox(
                    height: 69,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        text: "Next",
                        onPressed: () async {
                          if (cubit.formKey2.currentState!.validate()) {
                            pageController!.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);
                          }
                        }),
                  )
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: CustomTextRich(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.rigestername);
            },
            text: "Go back",
          ),
        ),
      ],
    );
  }
}
