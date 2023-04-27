import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class ClueWidget extends StatelessWidget {
  const ClueWidget({
    super.key,
    required this.controller,
  });
  final RoomController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final color = controller.room.value?.teamTurn ?? false ? purple : orange;

      return Visibility(
        visible: controller.user.role,
        replacement: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              "current clue is xxxx",
              style: FontStyles.bodyWhite
                  .copyWith(color: controller.room.value?.teamTurn ?? false ? white : black),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: MyTextField(
                //controller: controller.clue,
                prefixIcon: infoIcon,
                prefixIconColor: color,
                borderColor: white,
                hintText: "Enter your clue.",
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 90,
              child: MyTextField(
                //controller: controller.clueCount,
                hintText: "0",
                prefixIcon: numberIcon,
                prefixIconColor: color,
                borderColor: white,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8),
            MyButton(
              //onTap: () => controller.getClues(),
              width: 60,
              height: 60,
              color: color,
              text: "Give",
              textStyle: FontStyles.smallButtonwhite,
            ),
          ],
        ),
      );
    });
  }
}
