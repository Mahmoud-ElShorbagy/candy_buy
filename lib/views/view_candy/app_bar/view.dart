import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:flutter/material.dart';

import '../search/view.dart';
import '../../../widgets/custom_image.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SearchView(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.profile);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 20),
            child: const CustomImageWidget(
                imagePath: "assets/images/view/ch.svg", width: 64, height: 64),
          ),
        )
      ],
    );
  }
}
