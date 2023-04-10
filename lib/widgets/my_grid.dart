import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/widgets/game_card.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key, required this.wordModels});
  final List<WordModel> wordModels;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView(
        shrinkWrap:
            true, // belirli bir boy yoksa boy varmış gibi gösterir. col içinde listview vb kullanacksan vereceksin.
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          maxCrossAxisExtent: Get.width * 0.2,
        ),
        children: wordModels.map((e) => GameCard(text: e.word, color: e.color)).toList(),
      ),
    );
  }
}
