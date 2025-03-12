import 'package:flutter/widgets.dart';

import '../core/helpers/app_colors.dart';
import 'app_text.dart';

Widget buildFinalResuiltWidget() {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: Center(
        child: CustomText(
            text: "This is the final result",
            fontWeight: FontWeight.w700,
            color: AppColors.textBoldColor,
            fontSize: 16)),
  );
}
