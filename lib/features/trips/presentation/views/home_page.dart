import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/circle_icon_widget.dart';
import 'package:travel_app/core/widgets/custom_appbar_widget.dart';
import 'package:travel_app/core/widgets/filter_item_widget.dart';
import 'package:travel_app/core/widgets/horizontal_filter_scroll_widget.dart';
import 'package:travel_app/features/trips/presentation/views/widgets/trip_card.dart';
import 'package:travel_app/core/widgets/custom_bottom_navigation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColorW,
      appBar: CustomAppBarWidget(
        title: "Discover",
        leading: IconButton(
          onPressed: () {},
          icon: const CircleIconWidget(icon: HugeIcons.strokeRoundedSearch01),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleIconWidget(
              icon: HugeIcons.strokeRoundedNotification02,
              iconColor: kFirstTextColor,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            // Filters (horizontal scroll)
HorizontalFilterScrollWidget(
  items: ["Fulltrips", "Hotels", "Restaurants"],
  itemBuilder: (item) => buildFilterItem(item),
),


            SizedBox(height: 16.h),

            // Trips list (vertical scroll)
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  TripCard(
                    imageUrl: "assets/images/Paris.webp",
                    startingPlace: "London",
                    startingDate: "2023-06-15",
                    arrivalPlace: "Rome",
                    arrivalDate: "2023-06-22",
                    durationDays: 7,
                  ),
                  SizedBox(height: 16),
                  TripCard(
                    imageUrl: "assets/images/Paris.webp",
                    startingPlace: "Paris",
                    startingDate: "2023-07-01",
                    arrivalPlace: "Berlin",
                    arrivalDate: "2023-07-07",
                    durationDays: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// BottomNavigation
      bottomNavigationBar: CustomBottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
