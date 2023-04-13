import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              const Divider(
                height: 0,
                thickness: 5,
                color: orange,
                indent: 48,
                endIndent: 24,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      text: "Language",
                      width: double.infinity,
                      height: 60,
                      textStyle: FontStyles.buttonsPurple,
                      borderColor: purple,
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            actionsPadding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
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
                  const SizedBox(width: 8),
                  MyButton(
                    text: "Start",
                    width: 220,
                    height: 60,
                    color: orange,
                    textStyle: FontStyles.buttons,
                    onTap: () {
                      Get.to(const CreateRoomPage());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
