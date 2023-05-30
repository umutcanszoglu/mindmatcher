import 'package:flutter/material.dart';
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
                  : ListView(
                      children: [
                        const TopBarWidget(),
                        SizedBox(height: 15.h),
                        const MyGrid(),
                        SizedBox(height: 20.h),
                        ClueWidget(controller: controller),
                        SizedBox(height: 10.h),
                        const TeamInfoCard(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
