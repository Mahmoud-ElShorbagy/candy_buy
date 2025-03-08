import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconSvg extends StatelessWidget {
  const CustomIconSvg(
      {super.key,
      required this.image,
      required this.width,
      required this.height});
  final String image;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.backgroundWhiteColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                image,
                width: width,
                height: height,
              ),
            )),
        const SizedBox(
          width: 12,
        )
      ],
    );
  }
}
