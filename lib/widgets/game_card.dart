import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
  });
  final String text;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          text,
          style: FontStyles.gameWhite,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
