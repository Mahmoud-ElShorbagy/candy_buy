import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/views/view_candy/tiem/view.dart';
import 'package:candy_buy/widgets/app/custom_categories.dart';
import 'package:candy_buy/widgets/app/custom_content_category.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../models/product_dto.dart';
import '../header_nav/veiw.dart';

List<CategoreytDTO> categoreyFavorit = [];

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
              padding: EdgeInsets.all(16),
              itemCount: categoreyFavorit.isEmpty ? 1 : categoreyFavorit.length,
              itemBuilder: (context, index) {
                if (categoreyFavorit.isEmpty) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 300),
                      child: CustomText(
                        text: "Favorites List Is Empty.",
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBoldColor,
                        fontSize: 16,
                      ),
                    ),
                  );
                } else {
                  final categorey = categoreyFavorit[index];
                  return InkWell(
                    onTap: () {
                      RouteUtils.navigateToCategory(categorey, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12, right: 19),
                      width: 373,
                      height: 174,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          CustomCategoriesView(
                            images: categorey.images,
                            width: categorey.width,
                            height: categorey.height,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TimeView(time: time[index]),
                                CustomContentCategoryView(
                                  title: categorey.title,
                                  content: categorey.content,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ]));
  }
}
