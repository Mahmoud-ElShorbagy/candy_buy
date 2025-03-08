import 'package:flutter/widgets.dart';

import '../../../core/helpers/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.curnt});
  final int curnt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (index) {
            return Row(
              children: [
                Container(
                  width: index == curnt ? 10 : 8,
                  height: index == curnt ? 10 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: index == curnt
                        ? AppColors.textPrimaryColor
                        : AppColors.textPrimaryColor.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 4)
              ],
            );
          },
        ),
      ],
    );
  }
}
