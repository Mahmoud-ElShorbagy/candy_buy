import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:candy_buy/widgets/build_row.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../bag_products/total_price_cubit.dart';
import '../modal_bottom_sheet/veiw.dart';

class CheckoutCalculatorView extends StatelessWidget {
  final int subTotal;
  final int shippingFee;
  final int total;
  final int coupon;
  final void Function()? onPressed;
  const CheckoutCalculatorView({
    super.key,
    required this.subTotal,
    required this.shippingFee,
    required this.total,
    this.onPressed,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = TotalPriceCubit.get(context);
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      height: 318,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: AppColors.backgroundWhiteColor,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 44),
        child: Column(children: <Widget>[
          buildRow("Subtotal", subTotal, AppColors.texthintColor,
              FontWeight.w700, 14, 222, 12),
          buildRow("Shipping Fee", shippingFee, AppColors.texthintColor,
              FontWeight.w700, 14, 199, 12),
          if (cubit.isDiscountApplied)
            buildRow("Coupon (50% off)", coupon, AppColors.couponColor,
                FontWeight.w700, 14, 159, 12),
          const Divider(
            thickness: 2,
            color: AppColors.primaryColor,
          ),
          buildRow("Total", total, AppColors.texthintColor, FontWeight.w800, 16,
              238, 12),
          Container(
            margin: EdgeInsets.only(right: 44),
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 24, bottom: 20),
                    child: CustomButton(
                        onPressed: onPressed,
                        horizontal: 0,
                        text: "Secure Checkout")),
                ModalBottomSheetView(
                  cubit: cubit,
                  text: "Have a coupon code?",
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
