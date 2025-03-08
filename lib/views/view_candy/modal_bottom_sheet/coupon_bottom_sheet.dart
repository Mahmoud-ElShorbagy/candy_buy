import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../core/route_utils/route_utils.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_textform.dart';
import '../bag_products/total_price_cubit.dart';

class CouponBottomSheet extends StatefulWidget {
  const CouponBottomSheet({
    super.key,
    required this.cubit,
  });
  final TotalPriceCubit cubit;
  @override
  State<CouponBottomSheet> createState() => _CouponBottomSheetState();
}

class _CouponBottomSheetState extends State<CouponBottomSheet> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double _height = 276;
  String textCoupon = "loveCandy";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: AppColors.backgroundWhiteColor,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32, left: 24),
            child: Row(
              children: [
                CustomText(
                  fontSize: 20,
                  text: 'Add Coupon',
                  color: AppColors.textBoldColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Fredoka",
                ),
                SizedBox(
                  width: 210,
                ),
                InkWell(
                  onTap: () {
                    _height = MediaQuery.of(context).size.height * 0.3;
                    RouteUtils.goBack(context);
                  },
                  child: CustomImageWidget(
                      imagePath: "assets/images/icons/clpse.svg",
                      width: 40,
                      height: 40),
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 365,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: CustomTextField(
                validator: (v) {
                  if (v!.length != textCoupon.length) {
                    return "Invalid Coupon";
                  }
                  return null;
                },
                onChanged: (v) {
                  if (v == textCoupon) {
                    widget.cubit.applyDiscount(widget.cubit.state);
                  }
                },
                controller: controller,
                hint: "Enter your coupon",
                onTap: () {
                  _height = MediaQuery.of(context).size.height * 0.7;
                },
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 24),
              width: double.infinity,
              child: CustomButton(
                text: "Apply",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.text == textCoupon) {
                      RouteUtils.goBack(context);
                      _height = MediaQuery.of(context).size.height * 0.3;
                    }
                  }
                },
              ))
        ],
      ),
    );
  }
}
