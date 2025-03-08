import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../icon_heart/view.dart';
import '../../../widgets/app/custom_categories.dart';
import '../../../widgets/app/custom_content_category.dart';
import '../tiem/view.dart';

class CategoriesBodyView extends StatelessWidget {
  const CategoriesBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorey.length + 1,
      itemBuilder: (context, index) {
        if (index == categorey.length) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: CustomText(
                    text: "This is the final result",
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBoldColor,
                    fontSize: 16)),
          );
        }
        final categories = categorey[index];
        return InkWell(
          onTap: () {
            RouteUtils.navigateToCategory(index, context);
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
                    images: images[index],
                    width: width[index],
                    height: height[index],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TimeView(time: time[index]),
                        CustomContentCategoryView(
                          title: categories.title,
                          content: categories.content,
                        ),
                      ],
                    ),
                  ),
                  IconHeart(
                    onTap: () {},
                    marginLeft: categories.marginLeft,
                    icons: categories.icons,
                    index: index,
                  ),
                ],
              )),
        );
      },
    );
  }
}
