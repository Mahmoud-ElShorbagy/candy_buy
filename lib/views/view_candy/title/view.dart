import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app_text.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomText(
          fontSize: 24,
          text: 'Hello Shambhavi,',
          color: AppColors.textBoldColor,
          fontWeight: FontWeight.w400,
          fontFamily: "Fredoka",
        ),
        SizedBox(
          height: 4,
        ),
        CustomText(
            text: "What would you like to eat today",
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondaryColor700,
            fontSize: 14),
      ],
    );
  }
}
