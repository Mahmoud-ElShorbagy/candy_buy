import 'package:candy_buy/core/general_product_cubit/product_cubit.dart';
import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/models/cake_variables.dart';
import 'package:candy_buy/models/product_dto.dart';
import 'package:candy_buy/widgets/app_text.dart';
import 'package:candy_buy/widgets/final_result_widget.dart';
import 'package:candy_buy/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/route_utils/route_names.dart';
import '../../../widgets/app/custom_product_list_view.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/custom_button_add.dart';
import '../../../widgets/product_details.dart';

class CakePageView extends StatelessWidget {
  const CakePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = ProductCubit();
    return CustomProductListView(
      initialproducts: productCubit,
      child: ListView.builder(
        itemCount: productCake.length + 1,
        itemBuilder: (context, index) {
          if (index == productCake.length) {
            return buildFinalResuiltWidget();
          }
          final product = productCake[index];
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
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                width: 360,
                height: 52,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Products(
                          imagesProduct: product.imagesUrl,
                          width: product.width,
                          height: product.height),
                      SizedBox(
                        width: 8,
                      ),
                      ProductDetails(title: product.name, price: product.price),
                      Spacer(),
                      BlocListener<ProductCubit, ProductState>(
                        listener: (context, state) {
                          if (state is ProductSuccess &&
                              !state.isSnackBarShow) {
                            appSnackBar(context, state.message, "View Bag", () {
                              Navigator.pushNamed(
                                  context, RouteNames.bagProductsisview);
                            });
                            state.isSnackBarShow = true;
                          }
                        },
                        child: CustomButtonAdd(onTap: () {
                          ProductCubit cubit = ProductCubit.get(context);
                          cubit.addProduct(
                            ProductDTO(
                                name: nameCake[index],
                                imagesUrl: imagesUrlCake[index],
                                price: priceCake[index],
                                width: widthCake[index],
                                height: heightCake[index]),
                          );
                        }),
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
