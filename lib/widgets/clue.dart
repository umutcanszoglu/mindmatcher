import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class ClueWidget extends StatelessWidget {
  const ClueWidget({
    super.key,
    //required this.controller,
  });
  //final ClueController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: MyTextField(
            //controller: controller.clue,
            prefixIcon: infoIcon,
            prefixIconColor: orange,
            borderColor: white,
            hintText: "Enter your clue.",
          ),
        ),
        const SizedBox(width: 4),
        const SizedBox(
          width: 90,
          child: MyTextField(
            //controller: controller.clueCount,
            hintText: "0",
            prefixIcon: numberIcon,
            borderColor: white,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        MyButton(
          //onTap: () => controller.getClues(),
          width: 60,
          height: 60,
          color: orange,
          text: "Give",
          textStyle: FontStyles.smallButtonwhite,
        ),
      ],
    );
  }
}
