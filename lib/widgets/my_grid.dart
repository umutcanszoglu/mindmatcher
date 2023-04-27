import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            .map(
              (e) => GameCard(
                model: e,
                show: e.isOpen || role,
              ),
            )
            .toList()
            .animate()
            .shimmer(delay: 300.ms, duration: 1800.ms)
            .slide(begin: const Offset(0, -0.5))
            .shake(hz: 4, curve: Curves.easeInOutCubic)
            .scaleXY(end: 1.1, duration: 600.ms)
            .then(delay: 600.ms)
            .scaleXY(end: 1 / 1.1));
  }
}
