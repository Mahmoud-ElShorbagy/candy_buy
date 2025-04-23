import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/validators.dart';
import '../../core/route_utils/route_names.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';
import 'cubit.dart';
import '../../widgets/custom_textform.dart';
import 'managers/login_state_handler.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 69),
                child: const CustomLogoSvg()),
            Container(
              margin: const EdgeInsets.only(
                  top: 49, left: 114, right: 113.25, bottom: 21.08),
              child: const CustomImageWidget(
                  imagePath: "assets/images/login/Layer2.svg",
                  width: 148,
                  height: 174),
            ),
            const AppText(
                textBold: "Welcome Back",
                text:
                    "Create an account to enjoy fast delivery at no extra cost :)"),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, LoginState state) {
                LoginStateHandler.manageLoginState(state, context);
              },
              builder: (context, state) {
                LoginCubit cubit = LoginCubit.get(context);
                return AbsorbPointer(
                  absorbing: state is LoginLoading ? true : false,
                  child: Form(
                    key: cubit.formKey,
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
                            image: "assets/images/icons/email.png",
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: CustomTextField(
                            onTapIcon: () {
                              cubit.togglePasswordVisibility();
                            },
                            obscureText: state is PasswordHidden ? true : false,
                            validator: (v) {
                              return Validators.password(v);
                            },
                            controller: cubit.passwordController,
                            hint: 'Password',
                            image: state is PasswordHidden?
                                ? "assets/images/icons/lock.png"
                                : "assets/images/icons/openlock.png",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 215, top: 16, right: 43),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.forgetpassword);
                            },
                            child: const CustomText(
                              fontSize: 14,
                              text: "Forgot Password?",
                              color: AppColors.textPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 24, bottom: 16),
                            child: state is LoginLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.textPrimaryColor))
                                : CustomButton(
                                    text: "Login",
                                    onPressed: () async {
                                      cubit.logIn();
                                    })),
                        CustomTextRich(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.registerName);
                            },
                            text: "Don’t have an account? ",
                            textTap: "Sign Up"),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
