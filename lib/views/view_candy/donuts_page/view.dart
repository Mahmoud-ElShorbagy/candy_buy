import 'package:candy_buy/core/general_product_cubit/product_cubit.dart';
import 'package:candy_buy/models/donut_variables.dart';
import 'package:candy_buy/widgets/final_result_widget.dart';
import 'package:candy_buy/widgets/product_details.dart';
import 'package:candy_buy/widgets/products.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/route_utils/route_names.dart';
import '../../../models/product_dto.dart';
import '../../../widgets/app/custom_product_list_view.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button_add.dart';

class DonutsPageView extends StatelessWidget {
  const DonutsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final donutsCubit = ProductCubit();
    return CustomProductListView(
      initialproducts: donutsCubit,
      child: ListView.builder(
        itemCount: productDonut.length + 1,
        itemBuilder: (context, index) {
          if (index == productDonut.length) {
            return buildFinalResuiltWidget();
          }
          return Column(
            children: [
              if (index == 0)
                Container(
                  margin: const EdgeInsets.only(right: 290),
                  child: const CustomText(
                    text: "Best Sellers",
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBoldColor,
                    fontSize: 16,
                    fontFamily: "Fredoka",
                  ),
                ),
              if (index == 2)
                Container(
                  margin: const EdgeInsets.only(right: 310, top: 24),
                  child: const CustomText(
                    text: "All Items",
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBoldColor,
                    fontSize: 16,
                    fontFamily: "Fredoka",
                  ),
                ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                height: 52,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Products(
                          imagesProduct: productDonut[index].imagesUrl,
                          width: productDonut[index].width,
                          height: productDonut[index].height),
                      SizedBox(
                        width: 8,
                      ),
                      ProductDetails(
                          title: productDonut[index].name,
                          price: productDonut[index].price),
                      Spacer(),
                      BlocListener<ProductCubit, ProductState>(
                        listener: (context, state) {
                          if (state is ProductSuccess &&
                              !state.isSnackBarShow) {
                            appSnackBar(
                              context,
                              state.message,
                              "View Bag",
                              () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.bagProductsisview,
                                );
                              },
                            );
                            state.isSnackBarShow = true;
                          }
                        },
                        child: CustomButtonAdd(
                          onTap: () {
                            ProductCubit cubit = ProductCubit.get(context);
                            cubit.addProduct(
                              ProductDTO(
                                name: nameDonut[index],
                                imagesUrl: imagesUrlDonut[index],
                                price: priceDonut[index],
                                width: widthDonut[index],
                                height: heightDonut[index],
                              ),
                            );
                          },
                        ),
                      )
                    ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
