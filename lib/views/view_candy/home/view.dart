import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/views/view_candy/title/view.dart';
import 'package:candy_buy/views/view_candy/app_bar/view.dart';
import 'package:candy_buy/views/view_candy/scrollable_candy_List/view.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../../../core/route_utils/route_utils.dart';
import '../categories_body/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 19),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 16,
            ),
            SafeArea(child: const AppBarView()),
            TitleView(),
            Container(
                margin: const EdgeInsets.only(top: 18, bottom: 28),
                child: const ScrollableCandyListView()),
            const CustomText(
              fontSize: 24,
              text: 'Nearby Restaurants',
              color: AppColors.textBoldColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Fredoka",
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(child: CategoriesBodyView()),
            const SizedBox(
              height: 17,
            ),
          ]),
        ));
  }
}
