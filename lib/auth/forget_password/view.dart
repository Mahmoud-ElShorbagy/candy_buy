import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/helpers/app_colors.dart';
import '../../core/helpers/validators.dart';
import '../../core/route_utils/route_names.dart';

import '../../widgets/app_snackbar.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_logo.dart';
import '../../widgets/custom_textform.dart';
import 'cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetpasswordCubit(),
      child: Scaffold(
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
                    top: 49, left: 111, right: 102.34, bottom: 21.08),
                child: const CustomImageWidget(
                    imagePath: "assets/images/login/Group.svg",
                    width: 162,
                    height: 174),
              ),
              const AppText(
                  textBold: "Forgot Password?",
                  text:
                      "Enter the email associated with your account to recieve the reset password link. It takes upto 5 minutes."),
              const SizedBox(
                height: 69,
              ),
              BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
                listener: (context, state) async {
                  if (state is ForgetpasswordSuccess) {
                    appSnackBar(context, state.message, "Close", null);
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.emailsent,
                      arguments:
                          ForgetpasswordCubit.get(context).emailController.text,
                    );
                  } else if (state is ForgetpasswordError) {
                    appSnackBar(context, state.message, "Close", null);
                  }
                },
                builder: (context, state) {
                  ForgetpasswordCubit cubit = ForgetpasswordCubit.get(context);
                  return AbsorbPointer(
                    absorbing: state is ForgetpasswordLoading ? true : false,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: CustomTextField(
                              controller: cubit.emailController,
                              validator: (v) {
                                return Validators.email(v);
                              },
                              hint: 'Email Address',
                              image: "assets/images/icons/email.png",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.login,
                              );
                            },
                            child: const CustomText(
                              fontSize: 14,
                              text: "Remember Password? Log In",
                              color: AppColors.textPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.only(top: 35, bottom: 16),
                              child: state is ForgetpasswordLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: AppColors.textPrimaryColor,
                                    ))
                                  : CustomButton(
                                      text: "Send Link",
                                      onPressed: () async {
                                        if (cubit.formKey.currentState!
                                            .validate()) {
                                          cubit.forgetPassword();
                                        }
                                      })),
                          CustomTextRich(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.registerName,
                                );
                              },
                              text: "Don’t have an account? ",
                              textTap: "Sign Up"),
                          const SizedBox(
                            height: 44,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
