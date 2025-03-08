import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/general_product_cubit/product_cubit.dart';

class CustomProductListView extends StatefulWidget {
  final ProductCubit initialproducts;
  final Widget? child;
  const CustomProductListView({
    super.key,
    required this.initialproducts,
    this.child,
  });

  @override
  State<CustomProductListView> createState() => _CustomProductListViewState();
}

class _CustomProductListViewState extends State<CustomProductListView> {
  late ProductCubit productCubit;
  @override
  void initState() {
    productCubit = widget.initialproducts;
    super.initState();
  }

  @override
  void dispose() {
    productCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit(), child: widget.child);
  }
}
