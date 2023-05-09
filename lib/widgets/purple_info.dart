import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class PurpleInfo extends StatelessWidget {
  const PurpleInfo({super.key, required this.controller});
  final RoomController controller;

  @override
  Widget build(BuildContext context) {
    final purpleIsClosed = controller.room.value!.words.entries
        .where((e) => e.value.type == "p" && !e.value.isOpen)
        .length;
    return Column(
      children: [
        Text(
          "Purple",
          style: FontStyles.bodyWhite.copyWith(
            color: controller.room.value?.teamTurn ?? false ? white : black,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          purpleIsClosed.toString(),
          style: FontStyles.bodyWhite.copyWith(
            color: controller.room.value?.teamTurn ?? false ? white : black,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Predictors",
          style: FontStyles.smallButtonwhite.copyWith(
            color: controller.room.value?.teamTurn ?? false ? white : black,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          padding: const EdgeInsets.all(4),
          width: 130.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: controller.room.value?.teamTurn ?? false
                ? const Color.fromARGB(255, 139, 96, 210)
                : Colors.amber,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...controller.room.value!.players.entries
                  .where((t) => t.value.team == true && t.value.role == false)
                  .map(
                    (e) => Text(
                      e.value.name,
                      textAlign: TextAlign.center,
                      style: FontStyles.smallButtonwhite.copyWith(
                        color: controller.room.value?.teamTurn ?? false ? white : black,
                      ),
                    ),
                  )
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Narrator",
          style: FontStyles.smallButtonwhite.copyWith(
            color: controller.room.value?.teamTurn ?? false ? white : black,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.purpleNarrator?.name ?? "🎤🗿",
          style: FontStyles.smallButtonwhite.copyWith(
            color: controller.room.value?.teamTurn ?? false ? white : black,
          ),
        ),
      ],
    );
  }
}
