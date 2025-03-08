import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomButtonAdd extends StatelessWidget {
  const CustomButtonAdd({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 32,
        width: 84,
        decoration: BoxDecoration(
          color: AppColors.textPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const CustomText(
            text: "Add",
            fontWeight: FontWeight.w800,
            color: AppColors.backgroundWhiteColor,
            fontSize: 14),
      ),
    );
  }
}
