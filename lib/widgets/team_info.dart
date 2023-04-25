import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';

class TeamInfoCard extends GetView<RoomController> {
  const TeamInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        padding: const EdgeInsets.all(16),
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
          color: controller.room.value?.teamTurn ?? false ? purple : orange,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Purple",
                  style: FontStyles.smallButtonwhite.copyWith(
                    color: controller.room.value?.teamTurn ?? false ? white : black,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...controller.room.value!.players.entries
                          .where((t) => t.value.team == true)
                          .map(
                            (e) => Text(
                              e.value.name,
                              textAlign: TextAlign.center,
                            ),
                          )
                    ],
                  ),
                ),
              ],
            ),
            VerticalDivider(
              thickness: 2,
              color: controller.room.value?.teamTurn ?? false ? white : black,
              indent: 32,
              endIndent: 32,
            ),
            Column(
              children: [
                Text(
                  "Orange",
                  style: FontStyles.smallButtonwhite.copyWith(
                    color: controller.room.value?.teamTurn ?? false ? white : black,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...controller.room.value!.players.entries
                          .where((t) => t.value.team == false)
                          .map(
                            (e) => Text(
                              e.value.name,
                              textAlign: TextAlign.center,
                            ),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
