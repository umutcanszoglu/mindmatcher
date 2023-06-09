import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class UserCard extends GetView<RoomController> {
  const UserCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 40.h,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.myName,
                style: FontStyles.smallButtonBlack.copyWith(
                  color: black,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.circle, size: 20, color: controller.user.team ? purple : orange),
            ],
          ),
        ),
      ),
    );
  }
}
