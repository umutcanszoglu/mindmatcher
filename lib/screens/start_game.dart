import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/screens/create_room.dart';
import 'package:mindmatcher/widgets/my_button.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              const Spacer(),
              Text(
                "MIND",
                style: FontStyles.headers,
                textAlign: TextAlign.center,
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(delay: 300.ms, duration: 1800.ms),
              Text(
                "MATCHER",
                style: FontStyles.headers.copyWith(color: orange),
                textAlign: TextAlign.center,
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(delay: 300.ms, duration: 1800.ms),
              const Spacer(),
              Text(
                "Play with your friends",
                style: FontStyles.bodyBlack,
              ),
              Lottie.asset("assets/lotties/intro.json"),
              MyButton(
                text: "Start",
                width: double.infinity,
                height: 60.h,
                color: orange,
                textStyle: FontStyles.buttons,
                onTap: () {
                  Get.to(const CreateRoomPage());
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
