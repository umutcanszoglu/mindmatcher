import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class ClueWidget extends StatelessWidget {
  const ClueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: MyTextField(
            prefixIcon: infoIcon,
            prefixIconColor: orange,
            borderColor: white,
            hintText: "Enter your clue.",
          ),
        ),
        const SizedBox(width: 4),
        const SizedBox(
          width: 60,
          child: MyTextField(
            borderColor: white,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        MyButton(
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
