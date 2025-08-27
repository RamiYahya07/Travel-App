import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart' show kPrimaryColor;
import 'package:travel_app/core/widgets/custom_text_widget.dart';

class AuthToggle extends StatelessWidget {
  final bool isLoginSelected;
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  const AuthToggle({
    super.key,
    required this.isLoginSelected,
    required this.onLoginTap,
    required this.onRegisterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor, width: 0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLoginTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
              decoration: BoxDecoration(
                color: isLoginSelected ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomTextWidget(
                title: "Login",
                fontSize: 16.sp,
                textColor: isLoginSelected ? Colors.white : kPrimaryColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onRegisterTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
              decoration: BoxDecoration(
                color: !isLoginSelected ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomTextWidget(
                title: "Register",
                fontSize: 16.sp,
                textColor: !isLoginSelected ? Colors.white : kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
