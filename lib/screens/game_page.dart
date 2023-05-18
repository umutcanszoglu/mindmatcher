import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Obx(
              () => controller.room.value == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const TopBarWidget()
                            .animate()
                            .shimmer(delay: 300.ms, duration: 1800.ms)
                            .slide(begin: const Offset(0, -3))
                            .shake(hz: 4, curve: Curves.easeInOutCubic)
                            .scaleXY(end: 1.1, duration: 600.ms)
                            .then(delay: 600.ms)
                            .scaleXY(end: 1 / 1.1),
                        SizedBox(height: 15.h),
                        const Flexible(
                          child: MyGrid(),
                        ),
                        SizedBox(height: 20.h),
                        ClueWidget(controller: controller)
                            .animate()
                            .shimmer(delay: 300.ms, duration: 1800.ms)
                            .slide(begin: const Offset(-1, 0))
                            .shake(hz: 4, curve: Curves.easeInOutCubic)
                            .scaleXY(end: 1.1, duration: 600.ms)
                            .then(delay: 600.ms)
                            .scaleXY(end: 1 / 1.1),
                        SizedBox(height: 10.h),
                        const TeamInfoCard()
                            .animate()
                            .shimmer(delay: 300.ms, duration: 1800.ms)
                            .slide(begin: const Offset(1, 0))
                            .shake(hz: 4, curve: Curves.easeInOutCubic)
                            .scaleXY(end: 1.1, duration: 600.ms)
                            .then(delay: 600.ms)
                            .scaleXY(end: 1 / 1.1),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
