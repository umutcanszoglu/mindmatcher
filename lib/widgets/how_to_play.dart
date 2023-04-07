import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';

class HowToPlayCard extends StatelessWidget {
  const HowToPlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      width: double.infinity,
      height: Get.height / 3,
      decoration: BoxDecoration(
        color: dirtyWhite,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "How to play:",
            style: FontStyles.bodyPurple,
          ),
          Text(
            "1) Click on the CREATE ROOM button. Select the preffered game settings and start the game.",
            style: FontStyles.bodyPurple,
          ),
          Text(
            "2) Connect with your friends using your favorite audio.",
            style: FontStyles.bodyPurple,
          ),
          Text(
            "3) Share the room code with your friends.",
            style: FontStyles.bodyPurple,
          ),
        ],
      ),
    );
  }
}
