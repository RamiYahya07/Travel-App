import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalFilterScrollWidget extends StatelessWidget {
  final List<String> items;
  final Widget Function(String) itemBuilder;

  const HorizontalFilterScrollWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            itemBuilder(items[i]),
            if (i < items.length - 1) SizedBox(width: 8.w),
          ]
        ],
      ),
    );
  }
}
