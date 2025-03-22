import 'package:candy_buy/auth/register/receive_code/view.dart';
import 'package:candy_buy/auth/register/register_phone/view.dart';
import 'package:candy_buy/views/view_candy/chocolate_category/veiw.dart';
import 'package:candy_buy/views/view_candy/donuts_category/view.dart';
import 'package:candy_buy/views/view_candy/bag_products/view.dart';
import 'package:candy_buy/views/view_candy/home/view.dart';
import 'package:candy_buy/views/view_candy/hot_chocolate/veiw.dart';
import 'package:candy_buy/views/view_candy/suchis_category/view.dart';
import 'package:flutter/material.dart';
import '../../auth/email_sent/view.dart';
import '../../auth/forget_password/view.dart';
import '../../auth/login/view.dart';
import '../../auth/register/candy_gate/view.dart';
import '../../auth/register/register_page/view.dart';
import '../../auth/register/register_name/view.dart';
import '../../views/view_candy/favorites_page/view.dart';
import '../../views/walk_through/view.dart';
import '../../views/view_candy/cake_category/view.dart';
import '../../views/view_candy/candyfair_category/veiw.dart';
import '../../views/view_candy/ice_cream_category/view.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboardingview:
        return MaterialPageRoute(builder: (context) => const WalkthroughView());
      case RouteNames.rigestername:
        return MaterialPageRoute(
            builder: (context) => const RegisterNameView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RouteNames.forgetpassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView());
      case RouteNames.emailsent:
        return MaterialPageRoute(builder: (context) => const EmailSentView());
      case RouteNames.nextregisteremail:
        return MaterialPageRoute(
            builder: (context) => const RegisterMobileView());
      case RouteNames.nextregistermobile:
        return MaterialPageRoute(
            builder: (context) => const RegisterMobileView());
      case RouteNames.receivecode:
        return MaterialPageRoute(builder: (context) => const ReceiveCodeView());
      case RouteNames.candygate:
        return MaterialPageRoute(builder: (context) => const CandyGate());
      case RouteNames.register:
        return MaterialPageRoute(
            builder: (context) => const RegisterPageView());

      case RouteNames.homeview:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RouteNames.donuts:
        return MaterialPageRoute(
            builder: (context) => const DonutsCategoryView(),
            settings: settings);
      case RouteNames.bagProductsisview:
        return MaterialPageRoute(
          builder: (context) => const BagProductsView(),
        );
      case RouteNames.suchi:
        return MaterialPageRoute(
          builder: (context) => const SuchisCategoryView(),
        );
      case RouteNames.cake:
        return MaterialPageRoute(
          builder: (context) => const CakeCategoryView(),
        );
      case RouteNames.candy:
        return MaterialPageRoute(
          builder: (context) => const CandyFairCategoryView(),
        );
      case RouteNames.chocolate:
        return MaterialPageRoute(
          builder: (context) => const ChocolateCategoryView(),
        );
      case RouteNames.iceCream:
        return MaterialPageRoute(
          builder: (context) => const IceCreamCategoryView(),
        );
      case RouteNames.hotChocolate:
        return MaterialPageRoute(
          builder: (context) => const HotChocolateCategoryView(),
        );
      case RouteNames.favoritesPage:
        return MaterialPageRoute(
          builder: (context) => const FavoritesPageView(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const WalkthroughView());
    }
  }
}
