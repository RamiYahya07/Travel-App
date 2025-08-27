import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';

class CircleIconWidget extends StatelessWidget {
  final Color iconBackgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double radius;

  const CircleIconWidget({
    super.key,
    required this.icon,
    this.iconBackgroundColor = kBackGroundColor,
    this.iconColor = kFirstTextColor,
    this.iconSize = 22.0,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: iconBackgroundColor,
      child: Icon(icon, color: iconColor, size: iconSize),
    );
  }
}
