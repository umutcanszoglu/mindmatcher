import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/widgets/game_card.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap:
          true, // belirli bir boy yoksa boy varmış gibi gösterir. col içinde listview vb kullanacksan vereceksin.
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        maxCrossAxisExtent: Get.width * 0.2,
      ),
      children: List.generate(
        25,
        (index) => const GameCard(),
      ),
    );
  }
}
