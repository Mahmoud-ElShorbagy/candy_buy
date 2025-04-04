import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.horizontal = 28,
      this.width = 319,
      this.height = 64,
      this.fontSize = 18});
  final double fontSize;
  final String text;
  final double width;
  final double height;
  final double horizontal;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontal),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.textPrimaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  color: AppColors.backgroundWhiteColor,
                ))),
      ),
    );
  }
}
