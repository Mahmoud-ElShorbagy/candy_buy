import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class IconHeart extends StatelessWidget {
  const IconHeart({
    super.key,
    required this.marginLeft,
    required this.icons,
    this.onTap,
  });
  final void Function()? onTap;
  final double marginLeft;
  final String icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, bottom: 110),
      child: InkWell(
        onTap: onTap,
        child: CustomImageWidget(imagePath: icons, width: 32, height: 32),
      ),
    );
  }
}
