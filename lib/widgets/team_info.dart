import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/orange_info.dart';
import 'package:mindmatcher/widgets/purple_info.dart';

class TeamInfoCard extends GetView<RoomController> {
  const TeamInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        padding: const EdgeInsets.all(16),
        duration: const Duration(milliseconds: 300),
        width: double.infinity.w,
        height: 270.h,
        decoration: BoxDecoration(
          color: controller.room.value?.teamTurn ?? false ? purple : orange,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PurpleInfo(controller: controller),
            VerticalDivider(
              thickness: 2,
              color: controller.room.value?.teamTurn ?? false ? white : black,
              indent: 32.w,
              endIndent: 32.w,
            ),
            OrangeInfo(controller: controller),
          ],
        ),
      ),
    );
  }
}
