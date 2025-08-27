import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/custom_button_widget.dart';
import 'package:travel_app/features/auth/presentation/views/login_page.dart';
import 'package:travel_app/features/auth/presentation/views/register_page.dart';

class WelcomeBody extends StatelessWidget {
  final Animation<double> fadeLogo;
  final Animation<Offset> slideFirstButton;
  final Animation<Offset> slideSecondButton;

  const WelcomeBody({
    super.key,
    required this.fadeLogo,
    required this.slideFirstButton,
    required this.slideSecondButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70.h),
          FadeTransition(
            opacity: fadeLogo,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Image.asset('assets/images/logo_transparent.png'),
                ),

                Image.asset('assets/images/logo_transparent.png'),
              ],
            ),
          ),
          SizedBox(height: 100.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: Column(
              children: [
                SlideTransition(
                  position: slideFirstButton,
                  child: CustomButtons.CustomButtonWidget(
                    title: 'GET STARTED',
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    color: kBackGroundColorW,
                    fontColor: kPrimaryColor,
                  ),
                ),

                SizedBox(height: 12.h),

                SlideTransition(
                  position: slideSecondButton,
                  child: CustomButtons.CustomButtonWidget(
                    borderColor: kBackGroundColorW,
                    title: 'I ALREADY HAVE AN ACCOUNT',
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
