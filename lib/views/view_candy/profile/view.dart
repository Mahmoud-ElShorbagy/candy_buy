import 'package:candy_buy/auth/register/register_page/cubit.dart';
import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:candy_buy/views/view_candy/header_nav/veiw.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/build_row_setting.dart';
import 'package:candy_buy/widgets/custom_button.dart';
import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderNav(
              title: "Profile",
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Align(
                    child: CustomImageWidget(
                        imagePath: "assets/images/view/ch.svg",
                        width: 136,
                        height: 136),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      final cubit = RegisterCubit.get(context);
                      return CustomText(
                          fontFamily: "Fredoka",
                          text: cubit.nameController.text,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBoldColor,
                          fontSize: 24);
                    },
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 343,
                    height: 124,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.backgroundYellow_40),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              const CustomText(
                                  text: "Become a pro member and",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.orange_100,
                                  fontSize: 14),
                              const CustomText(
                                  text: "unlock premium benefits.",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.orange_100,
                                  fontSize: 14),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomButton(
                                  fontSize: 11,
                                  height: 32,
                                  width: 110,
                                  text: "Learn more",
                                  onPressed: () {}),
                            ]),
                        Spacer(),
                        CustomImageWidget(
                          imagePath: "assets/images/view/feed_back.svg",
                          height: 84,
                          width: 84,
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  buildRowSetting(
                      onTap: () {},
                      "Edit Profile",
                      "assets/images/view/profile.svg"),
                  const Divider(
                    thickness: 0.7,
                  ),
                  buildRowSetting(
                      "My Orders", "assets/images/view/shopping_basket.svg"),
                  const Divider(
                    thickness: 0.7,
                  ),
                  buildRowSetting(
                      "Payments", "assets/images/view/payments.svg"),
                  const Divider(
                    thickness: 0.7,
                  ),
                  buildRowSetting(
                      "Addresses", "assets/images/view/location.svg"),
                  const Divider(
                    thickness: 0.7,
                  ),
                  buildRowSetting(
                    "Log Out",
                    "assets/images/view/log_out.svg",
                    onTap: () async {
                      RouteUtils.signOut(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
