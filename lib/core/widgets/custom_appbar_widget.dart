import 'package:flutter/material.dart';
import 'package:travel_app/core/constants.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: kFirstTextColor,
          fontFamily: kPrimaryFont,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: kBackGroundColorW,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
