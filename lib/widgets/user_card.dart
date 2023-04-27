import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: Get.width / 4,
        height: 40,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            controller.myName,
            style: FontStyles.smallButtonBlack.copyWith(
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
