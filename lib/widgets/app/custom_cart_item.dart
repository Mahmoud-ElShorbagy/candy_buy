import 'package:candy_buy/models/product_dto.dart';
import 'package:candy_buy/views/view_candy/product_counter/view.dart';
import 'package:candy_buy/widgets/product_details.dart';
import 'package:candy_buy/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/general_product_cubit/product_cubit.dart';
import '../../views/view_candy/bag_products/total_price_cubit.dart';

List<ProductDTO> product = [];

class CustomCartItem extends StatelessWidget {
  final List<ProductDTO> products;
  final double containerWidth;
  final double containerHeight;
  final EdgeInsets margin;
  const CustomCartItem({
    super.key,
    required this.products,
    this.containerWidth = 340,
    this.containerHeight = 60,
    this.margin = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    final totalPriceCubit = TotalPriceCubit.get(context);
    final List<ProductCubit> productCubits =
        product.map((p) => ProductCubit(initialPrice: p.price)).toList();
    return ListView.builder(
      itemCount: product.length,
      itemBuilder: (context, index) {
        return BlocProvider.value(
          value: productCubits[index],
          child: Container(
            margin: margin,
            width: containerWidth,
            height: containerHeight,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Products(
                      imagesProduct: product[index].imagesUrl,
                      width: product[index].width,
                      height: product[index].height),
                  SizedBox(
                    width: 8,
                  ),
                  ProductDetails(
                      title: product[index].name, price: product[index].price),
                  Spacer(),
                  Builder(builder: (context) {
                    return ProductCounterVeiw(
                      onUpdateTotalPrice: () {
                        totalPriceCubit.updateTotalPrice(productCubits, 8);
                      },
                    );
                  })
                ]),
          ),
        );
      },
    );
  }
}
