import 'package:candy_buy/widgets/final_result_widget.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/route_utils/route_names.dart';
import 'package:candy_buy/models/candyfair_variables.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/general_product_cubit/product_cubit.dart';
import '../../../models/product_dto.dart';
import '../../../widgets/app/custom_product_list_view.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button_add.dart';
import '../../../widgets/product_details.dart';
import '../../../widgets/products.dart';

class CandyFairPageView extends StatelessWidget {
  const CandyFairPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = ProductCubit();
    return CustomProductListView(
      initialproducts: productCubit,
      child: ListView.builder(
        itemCount: productCandy.length + 1,
        itemBuilder: (context, index) {
          if (index == productCandy.length) {
            return buildFinalResuiltWidget();
          }
          final product = productCandy[index];
          return Column(
            children: [
              if (index == 0)
                Container(
                  margin: const EdgeInsets.only(top: 24, right: 290),
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
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
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
                      ProductDetails(
                          margin: EdgeInsets.zero,
                          title: product.name,
                          price: product.price),
                      BlocListener<ProductCubit, ProductState>(
                        listener: (context, state) {
                          if (state is ProductSuccess &&
                              !state.isSnackBarShow) {
                            appSnackBar(
                              context,
                              state.message,
                              onVisible: () {
                                state.isSnackBarShow = false;
                              },
                            );
                            state.isSnackBarShow = true;
                          } else if (state is ProductSuccess &&
                              !state.isSnackBarShow) {
                            appSnackBar(context, state.message, onVisible: () {
                              state.isSnackBarShow = false;
                            });
                            state.isSnackBarShow = true;
                          }
                        },
                        child: CustomButtonAdd(onTap: () {
                          if (index == index) {
                            ProductCubit cubit = ProductCubit.get(context);
                            Navigator.pushNamed(
                                context, RouteNames.bagProductsisview);
                            cubit.addProduct(
                              ProductDTO(
                                  name: nameCandy[index],
                                  imagesUrl: imagesUrlCandy[index],
                                  price: priceCandy[index],
                                  width: widthCandy[index],
                                  height: heightCandy[index]),
                            );
                          }
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
