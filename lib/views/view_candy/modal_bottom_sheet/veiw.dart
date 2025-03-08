import 'package:candy_buy/views/view_candy/modal_bottom_sheet/coupon_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../widgets/app_text.dart';
import '../bag_products/total_price_cubit.dart';

class ModalBottomSheetView extends StatelessWidget {
  const ModalBottomSheetView(
      {super.key, required this.text, required this.cubit});
  final String text;
  final TotalPriceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextRich(
        text: text,
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return CouponBottomSheet(cubit: cubit);
            },
          );
        });
  }
}
