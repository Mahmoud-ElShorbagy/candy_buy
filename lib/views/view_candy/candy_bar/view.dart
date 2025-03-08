import 'package:flutter/widgets.dart';

import '../../../widgets/custom_icon_svg.dart';

class CandyBarView extends StatelessWidget {
  const CandyBarView({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    required this.index,
  });

  final String image;
  final double width;
  final double height;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomIconSvg(
      image: image,
      width: width,
      height: height,
    );
  }
}
