import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

void appSnackBar(
  final BuildContext context,
  final String content,
  final String label,
  final void Function()? onPressed,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1000),
      action: SnackBarAction(
          label: label,
          textColor: AppColors.backgroundWhiteColor,
          onPressed: onPressed ?? () {}),
      backgroundColor: AppColors.textPrimaryColor,
      content: CustomText(
        text: content,
        color: AppColors.backgroundWhiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
