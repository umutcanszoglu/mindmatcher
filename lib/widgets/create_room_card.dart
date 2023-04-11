import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/screens/game_page.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class CreateRoomCard extends StatelessWidget {
  const CreateRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: (Get.height / 2) + 55,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 72),
              width: double.infinity,
              height: Get.height / 2,
              decoration: BoxDecoration(
                color: dirtyWhite,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  MyButton(
                    text: "Change",
                    textStyle: FontStyles.smallButtonOrange,
                    color: dirtyWhite,
                    borderColor: orange,
                    width: 80,
                    height: 25,
                  ),
                  const SizedBox(height: 48),
                  Text(
                    "Username",
                    style: FontStyles.bodyOrange,
                  ),
                  const MyTextField(
                    isFilled: true,
                    fillColor: white,
                    prefixIcon: nicknameIcon,
                    prefixIconColor: orange,
                    hintText: "username",
                    borderColor: dirtyWhite,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          color: purple,
                          text: "Create",
                          height: 60,
                          textStyle: FontStyles.buttons,
                          onTap: () => Get.to(const GamePage()),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: MyButton(
                          color: orange,
                          text: "Join",
                          height: 60,
                          textStyle: FontStyles.buttons,
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                actionsPadding:
                                    const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                                actionsAlignment: MainAxisAlignment.center,
                                backgroundColor: dirtyWhite,
                                title: Text(
                                  "Enter The Code",
                                  style: FontStyles.bodyBlack,
                                  textAlign: TextAlign.center,
                                ),
                                content: const MyTextField(
                                  isFilled: true,
                                  fillColor: white,
                                  prefixIcon: keyIcon,
                                  borderColor: dirtyWhite,
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MyButton(
                                          text: "Back",
                                          textStyle: FontStyles.smallButtonwhite,
                                          color: orange,
                                          width: double.infinity,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: MyButton(
                                          text: "Join",
                                          textStyle: FontStyles.smallButtonPurple,
                                          color: Colors.transparent,
                                          borderColor: purple,
                                          width: double.infinity,
                                          height: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: white, width: 5),
            ),
            child: Image.asset("assets/images/english.png"),
          ),
        ),
      ],
    );
  }
}
