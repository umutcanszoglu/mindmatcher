import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/my_button.dart';

class ExitPage extends GetView<RoomController> {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Lottie.asset("assets/lotties/closed.json"),
                ),
                MyButton(
                  width: double.infinity,
                  height: 60.h,
                  color: controller.user.team ? purple : orange,
                  text: "Exit The Game",
                  textStyle:
                      FontStyles.buttons.copyWith(color: controller.user.team ? white : black),
                  onTap: controller.deleteRoom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
