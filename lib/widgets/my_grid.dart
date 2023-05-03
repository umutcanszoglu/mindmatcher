import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/game_card.dart';

class MyGrid extends GetView<RoomController> {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final room = controller.room.value;
        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            maxCrossAxisExtent: Get.width * 0.2,
          ),
          children: room!.words.entries
              .map(
                (kv) => Obx(
                  () {
                    final user = controller.user;

                    return GameCard(
                      model: kv.value,
                      show: user.role || kv.value.isOpen,
                      onTap: () {
                        controller.openWord(kv.value);
                      },
                    )
                        .animate(key: ValueKey(kv.key + kv.value.isOpen.toString()))
                        .shimmer(delay: 300.ms, duration: 1800.ms)
                        .shake(hz: 4, curve: Curves.easeInOutCubic)
                        .scaleXY(end: 1.1, duration: 600.ms)
                        .then(delay: 600.ms)
                        .scaleXY(end: 1 / 1.1);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
