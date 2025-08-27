import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/custom_button_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';
import 'package:travel_app/core/widgets/custom_textfield_widget.dart';
import 'package:travel_app/core/widgets/horizontal_filter_scroll_widget.dart';
import 'package:travel_app/features/booking/presentation/views/widgets/book_appBar.dart';
import 'package:travel_app/features/booking/presentation/views/widgets/payment_item_widget.dart';

class BookingPaymentPage extends StatefulWidget {
  const BookingPaymentPage({super.key});
  static String id = 'BookingPaymentPage';

  @override
  State<BookingPaymentPage> createState() => _BookingPaymentPageState();
}

class _BookingPaymentPageState extends State<BookingPaymentPage> {
  final _formKey = GlobalKey<FormState>();

  // controllers
  final _nameController = TextEditingController();
  final _cardController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColorW,
      appBar: const BookingAppBar(title: "Book Trip"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Payment Methods ----
              CustomTextWidget(
                title: 'Payment Methods',
                textColor: kFirstTextColor,
                fontSize: 15.sp,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
                indent: 0,
                endIndent: 150.w,
              ),
              SizedBox(height: 12.h),

              // Scroll Horizontal
              HorizontalFilterScrollWidget(
                items: [
                  "assets/images/visa-compressed.svg",
                  "assets/images/mastercard-compressed.svg",
                  "assets/images/paypal-compressed.svg",
                  "assets/images/stripe-compressed.svg",
                ],
                itemBuilder: (path) => PaymentItemWidget(path),
              ),

              SizedBox(height: 24.h),

              // ---- Card Details ----
              CustomTextWidget(
                title: 'Card Details',
                textColor: kFirstTextColor,
                fontSize: 15.sp,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
                indent: 0,
                endIndent: 150.w,
              ),
              SizedBox(height: 16.h),

              // Card Holder Name
              CustomTextWidget(title: "Cardholder's name"),
              CustomTextFieldWidget(
                hintText: "Enter your name",
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter cardholder name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Card Number
              CustomTextWidget(title: "Card Number"),
              CustomTextFieldWidget(
                hintText: "**** **** **** 1234",
                controller: _cardController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.length != 16) {
                    return "Card number must be 16 digits";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Expiry Date
              CustomTextWidget(title: "Expiry"),
              CustomTextFieldWidget(
                hintText: "MM/YY",
                controller: _expiryController,
                validator: (value) {
                  if (value == null ||
                      !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$").hasMatch(value)) {
                    return "Enter valid date (MM/YY)";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // CVV
              CustomTextWidget(title: "CVC"),
              CustomTextFieldWidget(
                hintText: "***",
                controller: _cvcController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.length != 3) {
                    return "CVC must be 3 digits";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.h),

              // Button
              SizedBox(
                width: double.infinity,
                child: CustomButtons.CustomButtonWidget(
                  title: 'Confirm payment and booking',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // ✅ form is valid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Processing payment...")),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
