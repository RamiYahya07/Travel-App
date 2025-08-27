import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/widgets/custom_textField_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController birthdayController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isLoginSelected;
  final void Function(bool) onToggle;

  const RegisterForm({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.birthdayController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isLoginSelected,
    required this.onToggle,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  DateTime? birthday;

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";
  }

  Future<void> _pickBirthday() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: birthday ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      setState(() {
        birthday = picked;
        widget.birthdayController.text = _formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),

        Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              CustomTextWidget(title: "Full Name"),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                prefixIcon: const Icon(Icons.person_outline),
                controller: widget.fullNameController,
                hintText: "Enter your full name",
              ),
              SizedBox(height: 16.h),

              // Birthday
              CustomTextWidget(title: "Birthday"),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: _pickBirthday,
                child: AbsorbPointer(
                  child: CustomTextFieldWidget(
                    controller: widget.birthdayController,
                    hintText: birthday != null
                        ? _formatDate(birthday!)
                        : "Select your birthday",
                    validator: (value) =>
                        birthday == null ? 'Birthday is required' : null,
                    prefixIcon: const Icon(Icons.cake_outlined),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Email
              CustomTextWidget(title: "Email"),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                controller: widget.emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Enter your email",
              ),
              SizedBox(height: 16.h),

              // Password
              CustomTextWidget(title: "Password"),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                controller: widget.passwordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                hintText: "Enter your password",
                obscureText: true,
              ),
              SizedBox(height: 16.h),

              // Confirm Password
              CustomTextWidget(title: "Confirm Password"),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                controller: widget.confirmPasswordController,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                hintText: "Confirm your password",
                obscureText: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
