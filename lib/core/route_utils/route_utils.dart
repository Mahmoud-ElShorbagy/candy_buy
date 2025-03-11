import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static void navigateToCategory(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteNames.suchi);
        break;
      case 1:
        Navigator.pushNamed(context, RouteNames.donuts);
        break;
      case 2:
        Navigator.pushNamed(context, RouteNames.cake);
        break;
      case 3:
        Navigator.pushNamed(context, RouteNames.candy);
        break;
      case 4:
        Navigator.pushNamed(context, RouteNames.chocolate);
        break;
      case 5:
        Navigator.pushNamed(context, RouteNames.iceCream);
        break;
      case 6:
        Navigator.pushNamed(context, RouteNames.hotChocolate);
      default:
        Navigator.pushNamed(context, RouteNames.donuts);
    }
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static String getIntialRoute() {
    return (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? RouteNames.homeview
        : RouteNames.onboardingview;
  }

  static Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        RouteNames.login,
        (route) => false);
  }
}
