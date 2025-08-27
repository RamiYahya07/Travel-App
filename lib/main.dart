import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/features/auth/presentation/views/login_page.dart';
import 'package:travel_app/features/auth/presentation/views/register_page.dart';
import 'package:travel_app/features/booking/presentation/views/booking_info_page.dart';
import 'package:travel_app/features/booking/presentation/views/booking_payment_page.dart';

import 'package:travel_app/features/onboarding/presentation/views/welcome_view.dart';
import 'package:travel_app/features/trips/presentation/views/home_page.dart';
import 'package:travel_app/features/trips/presentation/views/widgets/trip_details_page.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        initialRoute: BookingInfoPage.id,

        debugShowCheckedModeBanner: false,
        routes: {
          WelcomePage.id: (context) => WelcomePage(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomePage.id: (context) => HomePage(),
          BookingInfoPage.id: (context) => BookingInfoPage(),
          BookingPaymentPage.id: (context) => BookingPaymentPage(),
          TripDetailsPage.id: (context) => TripDetailsPage(),
        },
      ),
    );
  }
}
