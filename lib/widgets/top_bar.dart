import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/game_log.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/players_card.dart';
import 'package:mindmatcher/widgets/rules_card.dart';
import 'package:mindmatcher/widgets/user_card.dart';

class TopBarWidget extends GetView<RoomController> {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Players
        const PlayersCard(),
        const SizedBox(width: 4),
        //GameLog
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
        //Rules
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
        const SizedBox(width: 46),
        //User
        UserCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  "${controller.user.name}'s Profile",
                  style: FontStyles.bodyBlack,
                  textAlign: TextAlign.center,
                ),
                content: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.user.team ? "Team: Purple" : "Team: Orange",
                        style: FontStyles.bodyBlack
                            .copyWith(color: controller.user.team ? purple : orange),
                      ),
                      Text(
                        controller.user.role ? "Role: Narrator" : "Role: Predictor",
                        style: FontStyles.bodyBlack.copyWith(),
                      ),
                      MyButton(
                        color: controller.user.team ? purple : orange,
                        text: "Switch Team",
                        width: 180,
                        height: 40,
                        textStyle: FontStyles.buttons,
                        onTap: () {
                          controller.switchTeam();
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              color: red,
                              text: "Narrator",
                              width: 180,
                              height: 40,
                              textStyle: FontStyles.buttons,
                              onTap: () {
                                controller.selectRole(true);
                              },
                            ),
                          ),
                          Expanded(
                            child: MyButton(
                              color: green,
                              text: "Predictor",
                              width: 180,
                              height: 40,
                              textStyle: FontStyles.buttons,
                              onTap: () {
                                controller.selectRole(false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
