import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

appSnackBar(BuildContext context, String content,
    {void Function()? onVisible}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      onVisible: onVisible,
      action: SnackBarAction(
          label: "Close",
          textColor: AppColors.backgroundWhiteColor,
          onPressed: () {}),
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
