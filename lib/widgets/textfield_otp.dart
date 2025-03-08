import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldOTP extends StatelessWidget {
  final bool first;
  final bool last;
  const TextFieldOTP(
      {super.key,
      this.controller,
      this.validator,
      this.onSaved,
      required this.first,
      required this.last});
  final void Function(String?)? onSaved;
  final String? Function(String? v)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
          onChanged: (value) {
            if (value.isNotEmpty && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          onSaved: onSaved,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundWhiteColor,
            focusedErrorBorder: buildBoreder(AppColors.errorBorederColor),
            enabled: true,
            focusedBorder: buildBoreder(Colors.red),
            enabledBorder: buildBoreder(AppColors.enabledBorederColor),
          )),
    );
  }
}

OutlineInputBorder buildBoreder(color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color));
}
