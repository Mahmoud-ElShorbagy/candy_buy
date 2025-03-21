import 'package:candy_buy/auth/register/register_name/view.dart';
import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app_text.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 35),
          child: CustomText(
            fontSize: 24,
            text: 'Hello $enterName,',
            color: AppColors.textBoldColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Fredoka",
          ),
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
