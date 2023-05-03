import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/my_button.dart';

class ResultPage extends GetView<RoomController> {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.room.value!.winner == controller.user.team ? "You Win" : "You Lost",
              style: FontStyles.headers.copyWith(color: controller.user.team ? purple : orange),
            ),
            const SizedBox(height: 32),
            MyButton(
              width: double.infinity,
              height: 60,
              color: controller.user.team ? purple : orange,
              text: "Go To Main Page",
              textStyle: FontStyles.buttons.copyWith(color: controller.user.team ? white : black),
              onTap: controller.deleteRoom,
            ),
          ],
        ),
      ),
    );
  }
}
