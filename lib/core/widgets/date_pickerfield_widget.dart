import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/widgets/custom_textfield_widget.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String? Function(String?)? validator;

  DatePickerField({
    super.key,
    required this.controller,

    this.initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    this.validator,
  }) : firstDate = firstDate ?? DateTime(1900, 1, 1),
       lastDate = lastDate ?? DateTime(2025, 12, 31);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      selectedDate = widget.initialDate;
      widget.controller.text = _formatDate(selectedDate!);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _pickDate() async {
    DateTime initial = selectedDate ?? DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = _formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: _pickDate,
          child: AbsorbPointer(
            child: CustomTextFieldWidget(
              controller: widget.controller,
              hintText: "Select date",
              validator: widget.validator,
            ),
          ),
        ),
      ],
    );
  }
}
