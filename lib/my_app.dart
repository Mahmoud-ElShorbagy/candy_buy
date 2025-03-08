import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:candy_buy/core/route_utils/app_routes.dart';
import 'package:candy_buy/core/route_utils/route_utils.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.textPrimaryColor));
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.appRoutes,
      initialRoute: RouteUtils.getIntialRoute(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
