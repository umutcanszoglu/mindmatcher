import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/clue.dart';
import 'package:mindmatcher/widgets/my_grid.dart';
import 'package:mindmatcher/widgets/team_info.dart';
import 'package:mindmatcher/widgets/top_bar.dart';

class GamePage extends GetView<RoomController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Obx(() => controller.room.value == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const TopBarWidget()
                        .animate()
                        .shimmer(delay: 300.ms, duration: 1800.ms)
                        .slide(begin: const Offset(0, -0.5))
                        .shake(hz: 4, curve: Curves.easeInOutCubic)
                        .scaleXY(end: 1.1, duration: 600.ms)
                        .then(delay: 600.ms)
                        .scaleXY(end: 1 / 1.1),
                    const SizedBox(height: 24),
                    Flexible(
                      child: MyGrid(
                        gameWords: controller.room.value!.words,
                        role: controller.user.role,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClueWidget(controller: controller)
                        .animate()
                        .shimmer(delay: 300.ms, duration: 1800.ms)
                        .slide(begin: const Offset(0, -0.5))
                        .shake(hz: 4, curve: Curves.easeInOutCubic)
                        .scaleXY(end: 1.1, duration: 600.ms)
                        .then(delay: 600.ms)
                        .scaleXY(end: 1 / 1.1),
                    const SizedBox(height: 16),
                    const TeamInfoCard()
                        .animate()
                        .shimmer(delay: 300.ms, duration: 1800.ms)
                        .slide(begin: const Offset(0, -0.07))
                        .shake(hz: 4, curve: Curves.easeInOutCubic)
                        .scaleXY(end: 1.1, duration: 600.ms)
                        .then(delay: 600.ms)
                        .scaleXY(end: 1 / 1.1),
                  ],
                )),
        ),
      ),
    );
  }
}
