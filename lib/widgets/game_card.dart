import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';

class GameCard extends GetView<RoomController> {
  const GameCard({
    super.key,
    this.onTap,
    required this.show,
    required this.model,
    required this.isOpen,
    required this.user,
    required this.word,
  });

  final WordModel model;
  final bool show;
  final bool isOpen;
  final Player user;
  final String word;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3),
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
          //controller.room.value!.words.entries.firstWhere((e) => e.value.word == word).value
          border: user.role && isOpen
              ? Border.all(
                  color: controller.room.value!.players.entries
                          .firstWhere((k) =>
                              k.value.name ==
                              controller.room.value!.words.entries
                                  .firstWhere((e) => e.value.word == word)
                                  .value
                                  .name)
                          .value
                          .team
                      ? blue
                      : black,
                  width: 3)
              : null,
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
