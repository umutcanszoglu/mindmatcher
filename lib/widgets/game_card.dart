import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/word_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    this.onTap,
    required this.show,
    required this.model,
  });

  final WordModel model;
  final bool show;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: show
              ? model.type == "o"
                  ? orange
                  : model.type == "w"
                      ? dirtyWhite
                      : model.type == "p"
                          ? purple
                          : black
              : blue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          model.word,
          style: FontStyles.gameWhite.copyWith(
              color:
                  show && (model.type == "p" || model.type == "b") ? Colors.white : Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
