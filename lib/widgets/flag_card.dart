import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmatcher/consts/theme.dart';

class FlagCard extends StatelessWidget {
  const FlagCard({super.key, required this.flag});
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: const BoxDecoration(
        color: dirtyWhite,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          flag,
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
    );
  }
}
