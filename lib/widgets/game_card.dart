import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dirtyWhite,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          "too many words here",
          style: FontStyles.gameBlack,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
