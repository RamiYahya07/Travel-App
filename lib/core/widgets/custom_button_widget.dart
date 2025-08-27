import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';

class CustomButtons {
  static Widget CustomButtonWidget({
    String? title, // make it optional
    required VoidCallback onTap,
    Color color = kPrimaryColor,
    Color fontColor = kBackGroundColorW,
    Widget? titleWidget, // your new param
    Color? borderColor,
    double radius = 16.0,
    double fontSize = 16.0,
    double borderWidth = 2.0,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: borderWidth.w)
                : BorderSide.none,
          ),
        ),
        child: titleWidget ??
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.bold,
                color: fontColor,
                fontFamily: 'Montserrat',
              ),
            ),
      ),
    );
  }
}
