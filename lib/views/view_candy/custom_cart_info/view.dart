import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_image.dart';

class CustomCartInfoView extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String subContent;
  final double width;
  const CustomCartInfoView({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.subContent,
    this.width = 340,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 19),
      height: 131,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backgroundWhiteColor,
      ),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(
              left: 28, top: 22.5, bottom: 22.5, right: 32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppTextBold(
                fontSize: 20,
                text: title,
                color: AppColors.textBoldColor,
                fontWeghit: FontWeight.w700),
            CustomText(
                text: content,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondaryColor700,
                fontSize: 14),
            CustomText(
                text: subContent,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondaryColor700,
                fontSize: 14),
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.04, bottom: 10.04, right: 20),
          child: CustomImageWidget(imagePath: image, width: 89, height: 111),
        )
      ]),
    );
  }
}
