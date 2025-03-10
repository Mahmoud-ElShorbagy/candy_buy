import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/validators.dart';
import '../../../core/route_utils/route_names.dart';
import '../managers/register_state_handler.dart';
import '../register_page/cubit.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_logo.dart';
import '../../../widgets/custom_textform.dart';

class RegisterPasswordView extends StatelessWidget {
  const RegisterPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 69, bottom: 58),
            child: const CustomLogoSvg()),
        Container(
          margin:
              const EdgeInsets.only(left: 109, right: 108.35, bottom: 25.08),
          child: const CustomImageWidget(
              imagePath: "assets/images/login/Layerbag.svg",
              width: 158,
              height: 174),
        ),
        const AppText(
            textBold: "Hi Shabhavi!",
            text:
                "Great, let’s choose a very strong password to keep your account safe from bad people out there "),
        const SizedBox(
          height: 56,
        ),
        BlocConsumer<RegisterCubit, RegisterState>(
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);

            return AbsorbPointer(
              absorbing: state is RegisterLoading ? true : false,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: cubit.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: CustomTextField(
                        validator: (v) {
                          return Validators.password(v);
                        },
                        controller: cubit.passwordController,
                        hint: 'Password',
                        image: "assets/images/icons/lock.png",
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomText(
                        text: "Choose a strong password :)",
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(102, 97, 92, 1),
                        fontSize: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 43, bottom: 16),
                      child: state is RegisterLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.textPrimaryColor),
                            )
                          : CustomButton(
                              text: "Next",
                              onPressed: () {
                                cubit.register();
                              }),
                    ),
                    Center(
                      child: CustomTextRich(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.register);
                        },
                        text: "Go back",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, RegisterState state) {
            RegisterStateHandler.manageRegisterState(state, context);
          },
        ),
      ],
    );
  }
}
