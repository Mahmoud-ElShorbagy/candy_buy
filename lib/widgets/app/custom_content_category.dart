import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/widgets.dart';

import '../app_text.dart';

class CustomContentCategoryView extends StatelessWidget {
  const CustomContentCategoryView({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontSize: 20,
          text: title,
          color: AppColors.textBoldColor,
          fontWeight: FontWeight.w600,
          fontFamily: "Fredoka",
        ),
        const SizedBox(
          height: 8,
        ),
        CustomText(
            text: content,
            fontWeight: FontWeight.w700,
            color: AppColors.texContentColor,
            fontSize: 14),
        CustomText(
            text: content,
            fontWeight: FontWeight.w700,
            color: AppColors.texContentColor,
            fontSize: 14),
      ],
    );
  }
}
