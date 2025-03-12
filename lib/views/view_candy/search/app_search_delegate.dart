import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/route_utils/route_utils.dart';
import '../../../models/category_variables.dart';
import '../../../widgets/app/custom_categories.dart';
import '../../../widgets/app/custom_content_category.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_image.dart';
import '../icon_heart/view.dart';
import '../tiem/view.dart';

class AppSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const CustomImageWidget(
          imagePath: "assets/images/icons/clpse.svg",
          width: 40,
          height: 40,
        ),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      onTap: () {
        close(context, null);
      },
      child: const SizedBox(
        height: 32,
        width: 32,
        child: Center(
          child: CustomImageWidget(
              imagePath: "assets/images/icons/arrow_back.svg",
              width: 9,
              height: 16),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _getMatchingItems(title);
    return _buildResultsOrSuggestions(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? title : _getMatchingItems(title);
    return _buildResultsOrSuggestions(suggestions);
  }

  List<String> _getMatchingItems(List<String> items) {
    return items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Widget _buildResultsOrSuggestions(List<String> items) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (query.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: CustomText(
                text: "Search Results",
                fontSize: 24,
                color: AppColors.texthintColor,
                fontWeight: FontWeight.w600,
                fontFamily: "Fredoka",
              ),
            ),
          if (items.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 280, left: 80),
              child: const CustomText(
                text: "There Are No Results",
                fontSize: 24,
                color: AppColors.textBoldColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: CustomText(
                            text:
                                items.isEmpty ? "" : "This is the final result",
                            fontWeight: FontWeight.w700,
                            color: AppColors.textBoldColor,
                            fontSize: 16)),
                  );
                }
                final categoryIndex = title.indexOf(items[index]);
                return _buildCategoryItem(categoryIndex, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(int index, BuildContext context) {
    return InkWell(
      onTap: () => RouteUtils.navigateToCategory(index, context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeView(time: time[index]),
                  CustomContentCategoryView(
                    title: title[index],
                    content: content[index],
                  ),
                ],
              ),
            ),
            IconHeart(
              onTap: () {},
              marginLeft: marginLeft[index],
              icons: icons[index],
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
