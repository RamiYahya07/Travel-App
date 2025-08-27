import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/widgets/custom_textField_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(title: "Email"),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: emailController,
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: "Enter your email",
            validator: (value) =>
                (value == null || value.isEmpty) ? "Please enter your email" : null,
          ),
          SizedBox(height: 16.h),

          CustomTextWidget(title: "Password"),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: passwordController,
            prefixIcon: const Icon(Icons.lock_outlined),
            hintText: "Enter your password",
            obscureText: true,
            validator: (value) =>
                (value == null || value.isEmpty) ? "Please enter your password" : null,
          ),
        ],
      ),
    );
  }
}
