import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/general_product_cubit/product_cubit.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_image.dart';

class ProductCounterVeiw extends StatelessWidget {
  //دالة تُستدعى عند تغيير عدد المنتجات لتحديث السعر الإجمالي.
  final VoidCallback onUpdateTotalPrice;
  const ProductCounterVeiw({
    super.key,
    required this.onUpdateTotalPrice,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("Building ProductCounter");
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        ProductCubit cubit = context.read<ProductCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                width: 76,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(224, 107, 56, 1)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.decrement();
                        onUpdateTotalPrice();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 24,
                        height: 28,
                        child: const CustomImageWidget(
                            imagePath: "assets/images/icons/decrement.svg",
                            width: 12,
                            height: 12),
                      ),
                    ),
                    Container(
                        color: AppColors.textPrimaryColor,
                        alignment: Alignment.center,
                        width: 24,
                        height: 28,
                        child: CustomText(
                            text: "${cubit.count}",
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 12)),
                    InkWell(
                      onTap: () {
                        cubit.increment();
                        onUpdateTotalPrice();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 24,
                        height: 28,
                        child: const CustomImageWidget(
                            imagePath: "assets/images/icons/increment.svg",
                            width: 12,
                            height: 12),
                      ),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5, bottom: 6, right: 4),
                alignment: Alignment.center,
                width: 34,
                height: 14,
                child: CustomText(
                    text: '\$${cubit.totalPrice.toStringAsFixed(0)}',
                    fontWeight: FontWeight.w700,
                    color: AppColors.texthintColor,
                    fontSize: 10))
          ],
        );
      },
    );
  }
}
