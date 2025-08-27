import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/circle_icon_widget.dart';
import 'package:travel_app/core/widgets/custom_button_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';
import 'package:travel_app/features/auth/presentation/views/widgets/auth_toggle_widget.dart';

import 'register_page.dart';
import 'widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: screenHeight * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/Paris.webp'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const CircleIconWidget(
                      icon: HugeIcons.strokeRoundedArrowTurnBackward,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextWidget(
                    title: "Go ahead and set up your account",
                    fontSize: 28.sp,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextWidget(
                    title: "Sign in to enjoy the best managing experience",
                    fontSize: 13.sp,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // Form Container
          Positioned(
            top: screenHeight * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthToggle(
                      isLoginSelected: isLoginSelected,
                      onLoginTap: () {
                        setState(() => isLoginSelected = true);
                      },
                      onRegisterTap: () {
                        setState(() => isLoginSelected = false);
                        Navigator.pushReplacementNamed(
                          context,
                          RegisterPage.id,
                        );
                      },
                    ),
                    SizedBox(height: 18.h),

                    LoginForm(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: CustomTextWidget(
                          title: "Forgot Password?",
                          fontSize: 12.sp,
                          textColor: kSecondTextColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtons.CustomButtonWidget(
                        fontSize: 18.sp,
                        title: "Login",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform login
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 26.h),

                    // Or login with divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextWidget(
                            title: "Or login with",
                            fontSize: 12.sp,
                            textColor: kSecondTextColor,
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    SizedBox(height: 26.h),

                    // Google button
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtons.CustomButtonWidget(
                        fontSize: 18.sp,
                        onTap: () {},
                        fontColor: kFirstTextColor.withOpacity(0.7),
                        color: kBackGroundColor,
                        title: '',
                        titleWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedGoogle,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 8.w),
                            CustomTextWidget(
                              title: "Google",
                              fontSize: 18.sp,
                              textColor: kFirstTextColor.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
