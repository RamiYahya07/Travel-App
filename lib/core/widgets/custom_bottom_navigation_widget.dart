import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';

import 'package:travel_app/core/widgets/circle_icon_widget.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 26.h),
      decoration: BoxDecoration(
        color: kBackGroundColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.r),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: kBackGroundColor,
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: kFirstTextColor.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildItem(0, Icons.home_outlined, "Home"),
            _buildItem(1, Icons.favorite_border, "Favorites"),
            _buildItem(2, Icons.airplanemode_active_outlined, "Trips"),
            _buildItem(3, Icons.menu_book_sharp, "Bookings"),
            _buildItem(4, Icons.person_outline, "Profile"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(int index, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? CircleIconWidget(
              icon: icon,
              iconColor: Colors.white,
              iconBackgroundColor: kPrimaryColor,
              iconSize: 28,
            )
          : Icon(icon, color: kFirstTextColor.withOpacity(0.5)),
      label: label,
    );
  }
}
