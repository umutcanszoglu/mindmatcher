import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmatcher/consts/theme.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: white,
            thickness: 1,
            indent: 16,
          ),
        ),
        SizedBox(width: 16.w),
        const Icon(Icons.circle_outlined, color: white, size: 15),
        SizedBox(width: 16.w),
        const Expanded(
          child: Divider(
            color: white,
            thickness: 1,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
