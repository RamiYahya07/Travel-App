import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // <-- make sure this is imported

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});
  static String id = 'TripDetailsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trip Details")),
      body: Center(
        child: SvgPicture.asset(
          "assets/icons/google-icon.svg",
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
