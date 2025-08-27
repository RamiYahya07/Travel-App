import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/features/onboarding/presentation/views/widgets/welcome_body.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static String id = 'WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleYAnimation;
  late Animation<double> _fadeLogoAnimation;
  late Animation<Offset> _slideFirstBtnAnimation;
  late Animation<Offset> _slideSecondBtnAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
//curved design shape
    _scaleYAnimation = Tween<double>(begin: 10.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeInOutCubic))
        .animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
        );
//logo
    _fadeLogoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.8)),
    );
//first button
    _slideFirstBtnAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.8, 0.9)),
        );
//second button
    _slideSecondBtnAnimation =
        Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.9, 1.0)),
        );

    _controller.forward(); 
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColorW,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _scaleYAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scaleY: _scaleYAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/curvedOrange.webp',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          WelcomeBody(
            fadeLogo: _fadeLogoAnimation,
            slideFirstButton: _slideFirstBtnAnimation,
            slideSecondButton: _slideSecondBtnAnimation,
          ),
        ],
      ),
    );
  }
}
