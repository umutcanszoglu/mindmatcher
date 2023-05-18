import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:type_text/type_text.dart';

class ResultPage extends GetView<RoomController> {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: dirtyWhite,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      controller.room.value!.winner == controller.user.team
                          ? "You Win"
                          : "You Lost",
                      style: FontStyles.headers
                          .copyWith(color: controller.user.team ? purple : orange),
                    ),
                    SizedBox(height: 24.h),
                    TypeText(
                      controller.room.value!.winner == controller.user.team
                          ? "I know that winning is satisfying, but you still have to stay humble and support others. Helping and encouraging other people can be a greater victory than you."
                          : "What matters is the experience itself rather than the outcome of the game. We don't always win, but it's what we experience that matters. Losing is an important learning opportunity to be better next time.",
                      duration: const Duration(seconds: 15),
                      textAlign: TextAlign.center,
                      style: FontStyles.bodyBlack,
                    ),
                    SizedBox(height: 32.h),
                    MyButton(
                      width: double.infinity.w,
                      height: 60.h,
                      color: controller.user.team ? purple : orange,
                      text: "Go To Main Page",
                      textStyle:
                          FontStyles.buttons.copyWith(color: controller.user.team ? white : black),
                      onTap: controller.deleteRoom,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
