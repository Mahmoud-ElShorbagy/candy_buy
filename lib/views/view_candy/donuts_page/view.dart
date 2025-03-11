import 'package:candy_buy/core/general_product_cubit/product_cubit.dart';
import 'package:candy_buy/models/donut_variables.dart';
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
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                  child: CustomText(
                      text: "This is the final result.",
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBoldColor,
                      fontSize: 16)),
            );
          }
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            height: 52,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Products(
                      imagesProduct: productDonut[index].imagesUrl,
                      width: productDonut[index].width,
                      height: productDonut[index].height),
                  ProductDetails(
                      margin: EdgeInsets.only(right: 80),
                      title: productDonut[index].name,
                      price: productDonut[index].price),
                  BlocListener<ProductCubit, ProductState>(
                    listener: (context, state) {
                      if (state is ProductSuccess && !state.isSnackBarShow) {
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
                          context,
                          RouteNames.bagProductsisview,
                        );
                        cubit.addProduct(
                          ProductDTO(
                              name: nameDonut[index],
                              imagesUrl: imagesUrlDonut[index],
                              price: priceDonut[index],
                              width: widthDonut[index],
                              height: heightDonut[index]),
                        );
                      }
                    }),
                  )
                ]),
          );
        },
      ),
    );
  }
}
