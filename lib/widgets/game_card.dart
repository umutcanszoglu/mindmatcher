import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          text,
          style: FontStyles.gameWhite,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
