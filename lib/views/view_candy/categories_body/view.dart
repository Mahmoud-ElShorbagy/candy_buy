import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/models/product_dto.dart';
import 'package:candy_buy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/final_result_widget.dart';
import '../favorites_page/cubit.dart';
import '../icon_heart/view.dart';
import '../../../widgets/app/custom_categories.dart';
import '../../../widgets/app/custom_content_category.dart';
import '../tiem/view.dart';

class CategoriesBodyView extends StatefulWidget {
  const CategoriesBodyView({
    super.key,
  });

  @override
  State<CategoriesBodyView> createState() => _CategoriesBodyViewState();
}

List<bool> isPressedList = List.generate(categorey.length, (index) => false);

class _CategoriesBodyViewState extends State<CategoriesBodyView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesItemCubit(),
      child: ListView.builder(
        itemCount: categorey.length + 1,
        itemBuilder: (context, index) {
          if (index == categorey.length) {
            return buildFinalResuiltWidget();
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
                    BlocConsumer<FavoritesItemCubit, FavoritesItemState>(
                      builder: (context, state) {
                        return IconHeart(
                          onTap: () {
                            final cubit = FavoritesItemCubit.get(context);
                            setState(() {
                              isPressedList[index] = !isPressedList[index];
                            });
                            if (index == index) {
                              cubit.addFavorit(CategoreytDTO(
                                  title: title[index],
                                  content: content[index],
                                  time: time[index],
                                  icons: icons[index],
                                  marginLeft: marginLeft[index],
                                  images: images[index],
                                  width: width[index],
                                  height: height[index]));
                            }
                          },
                          marginLeft: categories.marginLeft,
                          icons: isPressedList[index]
                              ? categories.images
                              : categories.icons,
                        );
                      },
                      listener:
                          (BuildContext context, FavoritesItemState state) {
                        if (state is FavoritesItemSuccess &&
                            !state.isShowSnackBar) {
                          appSnackBar(context, state.message, onVisible: () {
                            state.isShowSnackBar = false;
                          });
                          state.isShowSnackBar = true;
                        }
                      },
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
