import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
      {super.key,
      required this.imagePath,
      required this.width,
      required this.height});
  final String imagePath;
  final int width;
  final int height;
  @override
  Widget build(BuildContext context) {
    if (imagePath.endsWith(".svg")) {
      return SvgPicture.asset(imagePath,
          width: width.toDouble(), height: height.toDouble());
    } else if (imagePath.endsWith(".png") || imagePath.endsWith(".jpg")) {
      return Image.asset(imagePath,
          width: width.toDouble(), height: height.toDouble());
    } else {
      throw UnsupportedError('Unsupported image type');
    }
  }
}
