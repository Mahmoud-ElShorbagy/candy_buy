import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import '../register_email/view.dart';
import '../register_password/view.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            RegisterEmailView(pageController: pageController),
            const RegisterPasswordView()
          ],
        ),
      ),
    );
  }
}
