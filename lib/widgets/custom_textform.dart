import 'package:candy_buy/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.validator,
    super.key,
    required this.hint,
    this.image,
    this.initialImage,
    this.onSaved,
    this.controller,
    this.onChanged,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.onEditingComplete,
    this.enabled = true,
    this.onSearchPressed,
  });
  final void Function(String v)? onChanged;
  final void Function(String? v)? onSaved;
  final String? Function(String? v)? validator;
  final String? image;
  final String? initialImage;
  final String hint;
  final TextEditingController? controller;
  final double width;
  final double height;
  final bool? enabled;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final VoidCallback? onSearchPressed;
  @override
  Widget build(BuildContext context) {
    final String displayedImage = image ?? initialImage ?? '';
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: enabled == false ? onSearchPressed : null,
        child: AbsorbPointer(
          absorbing: enabled == false,
          child: TextFormField(
            enabled: enabled,
            onEditingComplete: onEditingComplete,
            onTap: onTap,
            onChanged: onChanged,
            controller: controller,
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: displayedImage.isNotEmpty
                  ? Container(
                      width: width,
                      height: height,
                      margin: EdgeInsets.only(left: 16, right: 8),
                      child: Image.asset(displayedImage))
                  : null,
              disabledBorder: buildBoreder(),
              enabledBorder: buildBoreder(),
              focusedBorder: buildBoreder(AppColors.focusedBorederColor),
              errorBorder: buildBoreder(AppColors.errorBorederColor),
              focusedErrorBorder: buildBoreder(AppColors.errorBorederColor),
              fillColor: AppColors.backgroundWhiteColor,
              filled: true,
              hintText: hint,
              hintStyle:
                  const TextStyle(fontSize: 15, color: AppColors.texthintColor),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBoreder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? AppColors.enabledBorederColor));
}
