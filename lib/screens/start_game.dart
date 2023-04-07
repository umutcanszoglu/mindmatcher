import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/screens/create_room.dart';
import 'package:mindmatcher/widgets/language_card.dart';
import 'package:mindmatcher/widgets/my_button.dart';

class StartGamePage extends StatelessWidget {
  const StartGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                indent: 56,
                endIndent: 24,
              ),
              const Spacer(),
              Row(
                children: [
                  const Expanded(child: LanguageCard()),
                  MyButton(
                    text: "Start",
                    width: 120,
                    height: 50,
                    color: purple,
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
