import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/clue.dart';
import 'package:mindmatcher/widgets/my_carousel.dart';
import 'package:mindmatcher/widgets/my_grid.dart';
import 'package:mindmatcher/widgets/top_bar.dart';

class GamePage extends GetView<RoomController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Obx(() => controller.room.value == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const TopBarWidget(),
                    const SizedBox(height: 32),
                    Flexible(
                        child: MyGrid(
                      gameWords: controller.room.value!.words,
                      show: controller.user.role,
                    )),
                    const SizedBox(height: 32),
                    const ClueWidget(),
                    const SizedBox(height: 32),
                    const MyCarousel(),
                  ],
                )),
        ),
      ),
    );
  }
}
