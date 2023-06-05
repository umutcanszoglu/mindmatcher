import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: dirtyWhite,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/mm.png", width: 150),
                        SizedBox(height: 32.h),
                        Text(
                          "You are exiting the game. You have had a great gaming experience! We hope you enjoyed and had fun. We wish you a nice day until your next adventure. See you soon!",
                          style: FontStyles.bodyBlack,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32.h),
                        MyButton(
                          width: double.infinity,
                          height: 60.h,
                          color: controller.user.team ? purple : orange,
                          text: "Exit The Game",
                          textStyle: FontStyles.buttons
                              .copyWith(color: controller.user.team ? white : black),
                          onTap: controller.deleteRoom,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
