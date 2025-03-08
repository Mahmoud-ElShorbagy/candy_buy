import 'package:flutter/widgets.dart';

import '../core/helpers/app_colors.dart';
import 'custom_image.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.imagesProduct,
    required this.width,
    required this.height,
  });

  final String imagesProduct;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.backgroundWhiteColor,
      ),
      width: 60,
      height: 60,
      child: Center(
        child: CustomImageWidget(
          imagePath: imagesProduct,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
