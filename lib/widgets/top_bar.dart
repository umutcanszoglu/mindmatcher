import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/game_log.dart';
import 'package:mindmatcher/widgets/players_card.dart';
import 'package:mindmatcher/widgets/rules_card.dart';
import 'package:mindmatcher/widgets/user_card.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PlayersCard(),
        const SizedBox(width: 4),
        GameLogCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  "Game Logs",
                  style: FontStyles.bodyBlack,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Team Purple's Master Gives FILM - 3", style: FontStyles.smallButtonBlack),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 4),
        RulesCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  "Game Rules",
                  style: FontStyles.bodyBlack,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Each teams has to choose their masters.",
                        style: FontStyles.smallButtonBlack),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 12),
        UserCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  "User's Profile",
                  style: FontStyles.bodyBlack,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Choose team", style: FontStyles.smallButtonBlack),
                    Text("Choose role", style: FontStyles.smallButtonBlack),
                    Text("switch team", style: FontStyles.smallButtonBlack),
                    Text("reset game", style: FontStyles.smallButtonBlack),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
