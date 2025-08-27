import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize ;

  CustomTextWidget({super.key, required this.title, this.textColor,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize??14.sp,
        color: textColor ?? kFirstTextColor.withOpacity(0.8),
        fontFamily: kPrimaryFont,
      ),
    );
  }
}
