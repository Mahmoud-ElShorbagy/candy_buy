import 'package:candy_buy/core/route_utils/route_generator.dart';
import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:candy_buy/views/view_candy/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:candy_buy/auth/register/receive_code/view.dart';
import 'package:candy_buy/views/view_candy/chocolate_category/veiw.dart';
import 'package:candy_buy/views/view_candy/donuts_category/view.dart';
import 'package:candy_buy/views/view_candy/bag_products/view.dart';
import 'package:candy_buy/views/view_candy/home/view.dart';
import 'package:candy_buy/views/view_candy/hot_chocolate/veiw.dart';
import 'package:candy_buy/views/view_candy/suchis_category/view.dart';
import '../../auth/email_sent/view.dart';
import '../../auth/forget_password/view.dart';
import '../../auth/login/view.dart';
import '../../auth/register/candy_gate/view.dart';
import '../../auth/register/register_page/view.dart';
import '../../auth/register/register_name/view.dart';
import '../../views/walk_through/view.dart';
import '../../views/view_candy/cake_category/view.dart';
import '../../views/view_candy/candyfair_category/veiw.dart';
import '../../views/view_candy/ice_cream_category/view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> appRoutes = {
    RouteNames.onboardingview: (context) => const WalkthroughView(),
    RouteNames.registerName: (context) => const RegisterNameView(),
    RouteNames.login: (context) => const LoginView(),
    RouteNames.forgetpassword: (context) => const ForgetPasswordView(),
    RouteNames.emailsent: (context) => const EmailSentView(),
    RouteNames.receivecode: (context) => const ReceiveCodeView(),
    RouteNames.candygate: (context) => const CandyGate(),
    RouteNames.register: (context) => const RegisterPageView(),
    RouteNames.homeview: (context) => const HomeView(),
    RouteNames.donuts: (context) => const DonutsCategoryView(),
    RouteNames.bagProductsisview: (context) => const BagProductsView(),
    RouteNames.suchi: (context) => const SuchisCategoryView(),
    RouteNames.cake: (context) => const CakeCategoryView(),
    RouteNames.candy: (context) => const CandyFairCategoryView(),
    RouteNames.chocolate: (context) => const ChocolateCategoryView(),
    RouteNames.iceCream: (context) => const IceCreamCategoryView(),
    RouteNames.hotChocolate: (context) => const HotChocolateCategoryView(),
    RouteNames.profile: (context) => const ProfileView(),
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return RouteGenerator.generateRoute(settings);
  }
}
