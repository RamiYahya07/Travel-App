import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/circle_icon_widget.dart';
import 'package:travel_app/core/widgets/custom_button_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';
import 'package:travel_app/features/auth/presentation/views/widgets/auth_toggle_widget.dart';
import 'widgets/register_from_widget.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoginSelected = false;

  void toggleAuth(bool loginSelected) {
    if (loginSelected) {
      Navigator.pushReplacementNamed(context, LoginPage.id);
    } else {
      setState(() {
        isLoginSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: screenHeight * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/Pyramids.webp'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.95),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          // Welcome Text
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
                    title: "Create Your Account",
                    fontSize: 28.sp,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextWidget(
                    title: "Sign up to enjoy the best managing experience",
                    fontSize: 13.sp,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // White Form Container
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
                      onRegisterTap: () {
                        setState(() => isLoginSelected = true);
                      },
                      onLoginTap: () {
                        setState(() => isLoginSelected = false);
                        Navigator.pushReplacementNamed(context, LoginPage.id);
                      },
                    ),

                    // Register Form
                    RegisterForm(
                      formKey: _formKey,
                      fullNameController: fullNameController,
                      birthdayController: birthdayController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      isLoginSelected: isLoginSelected,
                      onToggle: toggleAuth,
                    ),

                    SizedBox(height: 16.h),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtons.CustomButtonWidget(
                        fontSize: 18.sp,
                        title: "Sign Up",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform registration logic
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Or sign up with Google
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextWidget(
                            title: "Or sign up with",
                            fontSize: 12.sp,
                            textColor: kSecondTextColor,
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),
                    SizedBox(height: 32.h),

                    // Google Sign Up Button
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
