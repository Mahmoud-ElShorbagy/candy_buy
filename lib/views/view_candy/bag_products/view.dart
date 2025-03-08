import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:candy_buy/views/view_candy/bag_products/total_price_cubit.dart';
import 'package:candy_buy/views/view_candy/checkout_calculator/view.dart';
import 'package:candy_buy/views/view_candy/header_nav/veiw.dart';

import '../cart_product/view.dart';

class BagProductsView extends StatelessWidget {
  const BagProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalPriceCubit(),
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 190),
                  child: const HeaderNav(
                    title: "Your Bags",
                  )),
              const Expanded(child: CartProductView()),
              BlocBuilder<TotalPriceCubit, int>(
                builder: (context, totalPrice) {
                  final cubit = TotalPriceCubit.get(context);
                  final couponValue = cubit.isDiscountApplied
                      ? (totalPrice * 0.5 * 2).toInt()
                      : 0;
                  return CheckoutCalculatorView(
                    subTotal: totalPrice == 0 ? 0 : totalPrice - 8,
                    shippingFee: 8,
                    total: totalPrice,
                    coupon: -couponValue,
                    onPressed: () {
                      debugPrint(" totlaPrcie ================== $totalPrice");
                    },
                  );
                },
              )
            ],
          )),
    );
  }
}
