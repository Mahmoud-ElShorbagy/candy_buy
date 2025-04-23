import 'package:candy_buy/core/route_utils/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/product_dto.dart';

class RouteUtils {
  static void navigateToCategory(CategorytDTO categorey, BuildContext context) {
    switch (categorey.images) {
      case "assets/images/view/sweetsuchi.svg":
        Navigator.pushNamed(context, RouteNames.suchi);
        break;
      case "assets/images/view/Donut.svg":
        Navigator.pushNamed(context, RouteNames.donuts);
      case "assets/images/view/creamCake.svg":
        Navigator.pushNamed(context, RouteNames.cake);
      case "assets/images/view/Candylolipop.svg":
        Navigator.pushNamed(context, RouteNames.candy);
      case "assets/images/view/choclatelap.svg":
        Navigator.pushNamed(context, RouteNames.chocolate);
      case "assets/images/view/shakesrages.svg":
        Navigator.pushNamed(context, RouteNames.iceCream);
      case "assets/images/view/hotchoclate.svg":
        Navigator.pushNamed(context, RouteNames.hotChocolate);
      default:
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
