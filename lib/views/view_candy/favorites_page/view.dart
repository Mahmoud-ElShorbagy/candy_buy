import 'package:flutter/material.dart';

import '../../../core/helpers/app_colors.dart';
import '../header_nav/veiw.dart';

class FavoritesPageView extends StatelessWidget {
  const FavoritesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderNav(
            title: "Favorites",
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Center(child: Text("asdad"));
                }),
          ),
        ]));
  }
}
