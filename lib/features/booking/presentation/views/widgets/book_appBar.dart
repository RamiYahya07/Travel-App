import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/circle_icon_widget.dart';
import 'package:travel_app/core/widgets/custom_appbar_widget.dart';


class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BookingAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomAppBarWidget(
      title: title,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const CircleIconWidget(
          icon: HugeIcons.strokeRoundedArrowTurnBackward,
          iconColor: kFirstTextColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
