import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/views/view_candy/tiem/view.dart';
import 'package:candy_buy/widgets/app/custom_categories.dart';
import 'package:candy_buy/widgets/app/custom_content_category.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../models/product_dto.dart';
import '../header_nav/veiw.dart';

List<CategoreytDTO> categoryFavorit = [];

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
              itemCount: categoryFavorit.isEmpty ? 1 : categoryFavorit.length,
              itemBuilder: (context, index) {
                if (categoryFavorit.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    child: const Column(
                      children: [
                        SizedBox(height: 100),
                        CustomImageWidget(
                          imagePath: "assets/images/view/feed_back.svg",
                          height: 282,
                          width: 260,
                        ),
                        SizedBox(height: 24),
                        CustomText(
                          text: "Add your favorite sweets",
                          fontSize: 20,
                          color: AppColors.textBoldColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Ferdoka",
                        ),
                      ],
                    ),
                  );
                } else {
                  final category = categoryFavorit[index];
                  return InkWell(
                    onTap: () {
                      RouteUtils.navigateToCategory(category, context);
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
                            images: category.images,
                            width: category.width,
                            height: category.height,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TimeView(time: time[index]),
                                CustomContentCategoryView(
                                  title: category.title,
                                  content: category.content,
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
