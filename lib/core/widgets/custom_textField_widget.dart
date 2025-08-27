import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color backgroundColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.backgroundColor = kBackGroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: 13.sp,
        color: kFirstTextColor.withOpacity(1),
        fontFamily: kPrimaryFont,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13.sp,
          color: kFirstTextColor.withOpacity(0.8),
          fontFamily: kPrimaryFont,
        ),
        prefixIconColor: kPrimaryColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: backgroundColor,
      ),
    );
  }
}
