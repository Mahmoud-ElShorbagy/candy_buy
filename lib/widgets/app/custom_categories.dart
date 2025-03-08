import 'package:flutter/widgets.dart';

import '../custom_image.dart';

class CustomCategoriesView extends StatelessWidget {
  const CustomCategoriesView({
    super.key,
    required this.images,
    required this.width,
    required this.height,
  });

  final String images;
  final int width;
  final int height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.only(
              left: 31.9, right: 25, top: 34.8, bottom: 33.9),
          child: CustomImageWidget(
              imagePath: images, width: width, height: height)),
    );
  }
}
