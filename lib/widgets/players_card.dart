import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class PlayersCard extends GetView<RoomController> {
  const PlayersCard({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width / 6,
        height: 40,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            playersIcon,
            const SizedBox(width: 5),
            Obx(() => Text(controller.room.value?.players.length.toString() ?? "0",
                style: FontStyles.smallButtonBlack)),
          ],
        ),
      ),
    );
  }
}
