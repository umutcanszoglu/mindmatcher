import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class OrangeInfo extends StatelessWidget {
  const OrangeInfo({super.key, required this.controller});
  final RoomController controller;

  @override
  Widget build(BuildContext context) {
    final orangeIsClosed = controller.room.value!.words.entries
        .where((e) => e.value.type == "o" && !e.value.isOpen)
        .length;

    final color = controller.room.value?.teamTurn ?? false ? white : black;
    return Column(
      children: [
        Text(
          "Orange",
          style: FontStyles.bodyWhite.copyWith(color: color),
        ),
        SizedBox(height: 4.h),
        Text(
          orangeIsClosed.toString(),
          style: FontStyles.bodyWhite.copyWith(color: color),
        ),
        SizedBox(height: 4.h),
        Text(
          "Predictors",
          style: FontStyles.smallButtonwhite.copyWith(color: color),
        ),
        SizedBox(height: 4.h),
        Container(
          padding: const EdgeInsets.all(4),
          width: 130.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: controller.room.value?.teamTurn ?? false
                ? const Color.fromARGB(255, 139, 96, 210)
                : Colors.amber,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: controller.room.value!.teamTurn ? white : black, width: 2),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...controller.room.value!.players.entries
                  .where((t) => t.value.team == false && t.value.role == false)
                  .map(
                    (e) => Text(
                      e.value.name,
                      textAlign: TextAlign.center,
                      style: FontStyles.smallButtonwhite.copyWith(color: color),
                    ),
                  )
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Narrator",
          style: FontStyles.smallButtonwhite.copyWith(color: color),
        ),
        SizedBox(height: 4.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: controller.room.value?.teamTurn ?? false
                ? const Color.fromARGB(255, 139, 96, 210)
                : Colors.amber,
            border: Border.all(
                color: controller.room.value?.teamTurn ?? false ? white : black, width: 2),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Text(
            controller.orangeNarrator?.name ?? "🎤🗿",
            style: FontStyles.smallButtonwhite.copyWith(
              color: controller.room.value?.teamTurn ?? false ? white : black,
            ),
          ),
        ),
      ],
    );
  }
}
