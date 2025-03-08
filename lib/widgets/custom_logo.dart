import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLogoSvg extends StatelessWidget {
  const CustomLogoSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/Onboarding/Logo.svg",
        width: 160, height: 32);
  }
}
