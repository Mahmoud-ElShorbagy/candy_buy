import 'package:candy_buy/widgets/app_text.dart';
import 'package:flutter/material.dart';

Widget buildRow(String title, int value, Color color, FontWeight fontWeight,
    double fontSize, double width, double height) {
  return Column(
    children: [
      Row(
        children: [
          CustomText(
              text: title,
              fontWeight: fontWeight,
              color: color,
              fontSize: fontSize),
          SizedBox(
            width: width,
          ),
          CustomText(
              text: value.toStringAsFixed(1),
              fontWeight: fontWeight,
              color: color,
              fontSize: fontSize),
        ],
      ),
      SizedBox(
        height: height,
      ),
    ],
  );
}
