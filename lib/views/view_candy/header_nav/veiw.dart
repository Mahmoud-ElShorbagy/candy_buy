import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_image.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 48,
      margin: const EdgeInsets.only(left: 12, top: 48, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => RouteUtils.goBack(context),
            child: const SizedBox(
              height: 32,
              width: 32,
              child: Center(
                child: CustomImageWidget(
                    imagePath: "assets/images/icons/arrow_back.svg",
                    width: 9,
                    height: 16),
              ),
            ),
          ),
          CustomText(
              text: title,
              fontWeight: FontWeight.w700,
              color: AppColors.textBoldColor,
              fontSize: 14),
        ],
      ),
    );
  }
}
