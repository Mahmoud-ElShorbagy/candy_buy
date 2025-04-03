import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/general_product_cubit/product_cubit.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/route_utils/route_names.dart';
import '../../../models/product_dto.dart';
import '../../../models/suchi_variables.dart';
import '../../../widgets/app/custom_product_list_view.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button_add.dart';
import '../../../widgets/final_result_widget.dart';
import '../../../widgets/product_details.dart';
import '../../../widgets/products.dart';

class SuchisPageView extends StatelessWidget {
  const SuchisPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final suchiCubit = ProductCubit();
    return CustomProductListView(
      initialproducts: suchiCubit,
      child: ListView.builder(
        itemCount: productSuchi.length + 1,
        itemBuilder: (context, index) {
          if (index == productSuchi.length) {
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
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                width: 360,
                height: 52,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Products(
                          imagesProduct: productSuchi[index].imagesUrl,
                          width: productSuchi[index].width,
                          height: productSuchi[index].height),
                      SizedBox(
                        width: 8,
                      ),
                      ProductDetails(
                          title: productSuchi[index].name,
                          price: productSuchi[index].price),
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
                                    context, RouteNames.bagProductsisview);
                              },
                            );
                            state.isSnackBarShow = true;
                          }
                        },
                        child: CustomButtonAdd(onTap: () {
                          ProductCubit cubit = ProductCubit.get(context);
                          cubit.addProduct(
                            ProductDTO(
                                name: nameSuchis[index],
                                imagesUrl: imagesUrlSuchis[index],
                                price: priceSuchis[index],
                                width: widthSuchis[index],
                                height: heightSuchis[index]),
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
