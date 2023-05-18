import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class EndGuessing extends GetView<RoomController> {
  const EndGuessing({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: 65.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: controller.room.value!.teamTurn ? white : black, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            "End Guessing",
            style: FontStyles.gameBlack
                .copyWith(color: controller.room.value!.teamTurn ? white : black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
