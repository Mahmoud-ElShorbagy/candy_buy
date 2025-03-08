import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/views/walk_through/units/indicator.dart';
import 'package:candy_buy/views/pages/category_delivaried.dart';
import 'package:candy_buy/views/pages/category_delivary.dart';
import 'package:candy_buy/views/pages/category_mobile.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/route_utils/route_names.dart';

class WalkthroughView extends StatefulWidget {
  const WalkthroughView({super.key});

  @override
  State<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  List<Widget> pages = const <Widget>[
    CategoryMobile(),
    CategoryDelivary(),
    CategoryDelivared()
  ];
  int curnt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ListView(
          children: [
            SizedBox(
              height: 800,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return pages[index];
                    },
                    onPageChanged: (value) {
                      setState(() {
                        curnt = value;
                      });
                    },
                  ),
                  Positioned(
                    child: Container(
                        margin: const EdgeInsets.only(
                          top: 607,
                        ),
                        child: PageIndicator(curnt: curnt)),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 678,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                              text: "Get Started",
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteNames.rigestername);
                              }),
                        ),
                        const SizedBox(height: 16),
                        CustomTextRich(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.login);
                          },
                          text: "Already Registered?  ",
                          textTap: "Login",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
