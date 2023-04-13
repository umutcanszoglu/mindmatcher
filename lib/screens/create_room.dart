import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/player_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/screens/game_page.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final playerController = Get.put(PlayerController());
    final roomController = Get.put(RoomController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                "CREATE ROOM",
                style: FontStyles.headers,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Lottie.asset("assets/lotties/create.json"),
              MyTextField(
                controller: playerController.username,
                prefixIcon: nicknameIcon,
                prefixIconColor: orange,
                hintText: "username",
                borderColor: dirtyWhite,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      borderColor: purple,
                      color: white,
                      text: "Create",
                      height: 60,
                      textStyle: FontStyles.buttonsPurple,
                      onTap: () {
                        playerController.createPlayer();
                        //roomController.createRoom();
                        Get.to(const GamePage());
                      },
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                            actionsPadding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
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
    );
  }
}
