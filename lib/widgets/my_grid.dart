import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/controllers/word_controller.dart';
import 'package:mindmatcher/widgets/game_card.dart';

class MyGrid extends GetView<WordController> {
  const MyGrid({super.key});

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
        children: controller.wordModels
            .map(
              (e) => GameCard(
                text: e.word,
                color: e.color,
                onTap: () {
                  e.isSelected = true;
                  controller.wordModels.refresh();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
