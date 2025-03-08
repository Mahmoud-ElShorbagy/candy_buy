import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/app_text.dart';
import '../../../widgets/custom_image.dart';

class TimeView extends StatelessWidget {
  const TimeView({
    super.key,
    required this.time,
  });
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomImageWidget(
            imagePath: "assets/images/view/bike.svg", width: 20, height: 20),
        const SizedBox(
          width: 4,
        ),
        CustomText(
          fontSize: 14,
          text: time,
          color: AppColors.textTimeColor,
          fontWeight: FontWeight.w700,
          fontFamily: "Fredoka",
        ),
      ],
    );
  }
}
