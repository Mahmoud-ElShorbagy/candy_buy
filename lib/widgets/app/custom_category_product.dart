import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:candy_buy/views/view_candy/header_nav/veiw.dart';
import 'package:flutter/material.dart';

import '../../views/view_candy/custom_cart_info/view.dart';
import '../custom_image.dart';

class CustomCategoryProduct extends StatelessWidget {
  const CustomCategoryProduct(
      {super.key,
      this.title = "",
      this.titleCart = "",
      this.contentCart = "",
      this.subContentCart = "",
      this.imageCart = "assets/images/view/unicorn.svg",
      this.child,
      this.width = 340});
  final String? title;
  final String? titleCart;
  final String? contentCart;
  final String? subContentCart;
  final String? imageCart;
  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            HeaderNav(
              title: title ?? "",
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.favoritesPage);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 130, top: 30),
                child: const CustomImageWidget(
                    imagePath: "assets/images/view/heart-outline.svg",
                    width: 32,
                    height: 32),
              ),
            ),
          ],
        ),
        CustomCartInfoView(
          title: titleCart ?? "",
          content: contentCart ?? "",
          subContent: subContentCart ?? "",
          image: imageCart ?? "assets/images/view/unicorn.svg",
          width: width,
        ),
        Expanded(
          child: child ?? const SizedBox(),
        ),
      ]),
    );
  }
}
