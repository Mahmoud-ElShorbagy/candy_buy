import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.textBold, required this.text});
  final String textBold;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextBold(
            fontSize: 24,
            text: textBold,
            color: AppColors.textBoldColor,
            fontWeghit: FontWeight.w700),
        const SizedBox(height: 12),
        SizedBox(
          height: 85,
          width: 324,
          child: CustomText(
              fontSize: 16,
              text: text,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondaryColor700),
        ),
      ],
    );
  }
}

class AppTextBold extends StatelessWidget {
  const AppTextBold(
      {super.key,
      required this.fontSize,
      required this.text,
      required this.color,
      required this.fontWeghit});
  final FontWeight fontWeghit;
  final double fontSize;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeghit,
          color: color,
          fontFamily: "Fredoka"),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.fontWeight,
      required this.color,
      required this.fontSize,
      this.fontFamily = "Nunito"});
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final String fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text,
    this.textTap,
    required this.onTap,
  });
  final String text;
  final String? textTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: text,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimaryColor,
                fontSize: 16,
                fontFamily: "Nunito"),
          ),
          TextSpan(
            text: textTap,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimaryColor,
              fontSize: 16,
              fontFamily: "Nunito",
            ),
          ),
        ])),
      ),
    );
  }
}
