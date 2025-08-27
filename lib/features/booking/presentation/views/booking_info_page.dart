import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/widgets/custom_button_widget.dart';
import 'package:travel_app/core/widgets/custom_text_widget.dart';
import 'package:travel_app/core/widgets/custom_textfield_widget.dart';
import 'package:travel_app/features/booking/presentation/views/widgets/book_appBar.dart';

class BookingInfoPage extends StatefulWidget {
  static String id = 'BookingInfoPage';
  const BookingInfoPage({super.key});

  @override
  State<BookingInfoPage> createState() => _BookingInfoPageState();
}

class _BookingInfoPageState extends State<BookingInfoPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController bookingNameController = TextEditingController();
  final TextEditingController tripDescriptionController =
      TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController travelersController = TextEditingController();
  final TextEditingController pricePerPersonController =
      TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  @override
  void dispose() {
    // Dispose controllers
    bookingNameController.dispose();
    tripDescriptionController.dispose();
    fromController.dispose();
    toController.dispose();
    durationController.dispose();
    travelersController.dispose();
    pricePerPersonController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, {String? label}) {
    if (value == null || value.isEmpty) return '$label is required';
    return null;
  }

  String? _numberValidator(String? value, {String? label}) {
    if (value == null || value.isEmpty) return '$label is required';
    if (double.tryParse(value) == null) return '$label must be a number';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColorW,
      appBar: const BookingAppBar(title: "Book a trip"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(title: 'Booking Name'),
              CustomTextFieldWidget(
                hintText: 'Rami',
                controller: bookingNameController,
                validator: (value) =>
                    _requiredValidator(value, label: 'Booking Name'),
              ),
              SizedBox(height: 16.h),

              CustomTextWidget(title: "Trip Description"),
              CustomTextFieldWidget(
                maxLines: 6,
                hintText: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
""",
                controller: tripDescriptionController,
                validator: (value) =>
                    _requiredValidator(value, label: 'Trip Description'),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "From"),
                        CustomTextFieldWidget(
                          hintText: "London",
                          controller: fromController,
                          validator: (value) =>
                              _requiredValidator(value, label: 'From'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "To"),
                        CustomTextFieldWidget(
                          hintText: "Rome",
                          controller: toController,
                          validator: (value) =>
                              _requiredValidator(value, label: 'To'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "Start Date"),
                        GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: startDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setState(() {
                                startDate = picked;
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: CustomTextFieldWidget(
                              hintText: startDate != null
                                  ? startDate!.toString().split(' ')[0]
                                  : "Select date",
                              validator: (value) => startDate == null
                                  ? 'Start Date is required'
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "End Date"),
                        GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: endDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setState(() {
                                endDate = picked;
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: CustomTextFieldWidget(
                              hintText: endDate != null
                                  ? endDate!.toString().split(' ')[0]
                                  : "Select date",
                              validator: (value) => endDate == null
                                  ? 'End Date is required'
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              CustomTextWidget(title: "Duration"),
              CustomTextFieldWidget(
                hintText: "7 days",
                controller: durationController,
                validator: (value) =>
                    _requiredValidator(value, label: 'Duration'),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "Travelers"),
                        CustomTextFieldWidget(
                          hintText: "2",
                          keyboardType: TextInputType.number,
                          controller: travelersController,
                          validator: (value) =>
                              _numberValidator(value, label: 'Travelers'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(title: "Trip Price per Person"),
                        CustomTextFieldWidget(
                          hintText: "\$500",
                          keyboardType: TextInputType.number,
                          controller: pricePerPersonController,
                          validator: (value) => _numberValidator(
                            value,
                            label: 'Price per Person',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              CustomButtons.CustomButtonWidget(
                title: "Complete",
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
