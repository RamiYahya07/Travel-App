import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/features/auth/presentation/views/login_page.dart';

class TripCard extends StatelessWidget {
  final String imageUrl;
  final String startingPlace;
  final String startingDate;
  final String arrivalPlace;
  final String arrivalDate;
  final int durationDays;

  const TripCard({
    super.key,
    required this.imageUrl,
    required this.startingPlace,
    required this.startingDate,
    required this.arrivalPlace,
    required this.arrivalDate,
    required this.durationDays,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginPage.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        color: kBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),

        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //trip image
              SizedBox(
                height: 160.h,
                width: double.infinity,
                // child: Image.network(imageUrl, fit: BoxFit.cover),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              //content of card
              Column(
                children: [
                  //first row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From: $startingPlace",
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        startingDate,
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  //second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To: $arrivalPlace",
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        arrivalDate,
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  //third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trip Duration:",
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        "$durationDays days",
                        style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
