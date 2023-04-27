import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class OrangeInfo extends StatelessWidget {
  const OrangeInfo({super.key, required this.controller});
  final RoomController controller;

  @override
  Widget build(BuildContext context) {
    final orangeCount = controller.room.value!.words.where((e) => e.type == "o").length;
    final orangeIsOpen =
        controller.room.value!.words.where((e) => e.type == "o" && e.isOpen).length;
    final color = controller.room.value?.teamTurn ?? false ? white : black;
    return Column(
      children: [
        Text(
          "Orange",
          style: FontStyles.bodyWhite.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Text(
          (orangeCount - orangeIsOpen).toString(),
          style: FontStyles.bodyWhite.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Text(
          "Predictors",
          style: FontStyles.smallButtonwhite.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(4),
          width: 130,
          height: 100,
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
        const SizedBox(height: 8),
        Text(
          "Narrator",
          style: FontStyles.smallButtonwhite.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Text(
          controller.orangeNarrator?.name ?? "🎤🗿",
          style: FontStyles.smallButtonwhite.copyWith(color: color),
        ),
      ],
    );
  }
}
