  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';

Widget buildFilterItem(String title) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: kPrimaryFont,
          fontSize: 14.sp,
          color: kFirstTextColor.withOpacity(0.8),
        ),
      ),
    );
  }

