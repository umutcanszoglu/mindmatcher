import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/word_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    this.onTap,
    required this.model,
  });

  final WordModel model;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: model.type == "o" ? orange : dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          model.word,
          style: FontStyles.gameWhite.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
