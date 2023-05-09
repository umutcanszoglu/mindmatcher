import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/languages.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/screens/create_room.dart';
import 'package:mindmatcher/widgets/flag_card.dart';
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
                "MIND MATCHER",
                style: FontStyles.headers,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                "Play with your friends",
                style: FontStyles.bodyOrange,
              ),
              Lottie.asset("assets/lotties/intro.json"),
              Divider(
                height: 0,
                thickness: 5,
                color: orange,
                indent: 48.w,
                endIndent: 24.w,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      text: "Language",
                      width: double.infinity.w,
                      height: 60.h,
                      textStyle: FontStyles.buttonsPurple,
                      borderColor: purple,
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            actionsPadding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                            actionsAlignment: MainAxisAlignment.center,
                            backgroundColor: white,
                            title: Text(
                              "Language",
                              style: FontStyles.bodyBlack,
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ...Languages.languages.map((e) => FlagCard(flag: e)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  MyButton(
                    text: "Start",
                    width: 220.w,
                    height: 60.h,
                    color: orange,
                    textStyle: FontStyles.buttons,
                    onTap: () {
                      Get.to(const CreateRoomPage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
