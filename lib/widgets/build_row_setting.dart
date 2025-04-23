import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';

Widget buildRowSetting(final String text, final String imagePath,
    {final void Function()? onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CustomImageWidget(imagePath: imagePath, width: 24, height: 24),
            SizedBox(
              width: 8,
            ),
            CustomText(
                text: text,
                fontWeight: FontWeight.w700,
                color: AppColors.textProductColor,
                fontSize: 14),
          ],
        ),
      ),
      SizedBox(
        height: 16,
      ),
    ],
  );
}
