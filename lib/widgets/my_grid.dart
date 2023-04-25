import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/widgets/game_card.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key, required this.role, required this.gameWords});
  final List<WordModel> gameWords;
  final bool role;
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        maxCrossAxisExtent: Get.width * 0.2,
      ),
      children: gameWords
          .map((e) => GameCard(
                model: e,
                show: e.isOpen || role,
              ))
          .toList(),
    );
  }
}
