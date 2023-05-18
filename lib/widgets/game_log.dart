import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';

class GameLogCard extends StatelessWidget {
  const GameLogCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        width: (Get.width / 6).w,
        height: 40.h,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Text("Logs", style: FontStyles.smallButtonBlack)),
      ),
    );
  }
}
