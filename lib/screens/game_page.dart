import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/clue_controller.dart';
import 'package:mindmatcher/controllers/word_controller.dart';
import 'package:mindmatcher/widgets/clue.dart';
import 'package:mindmatcher/widgets/my_carousel.dart';
import 'package:mindmatcher/widgets/my_grid.dart';
import 'package:mindmatcher/widgets/top_bar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WordController());
    final clueController = Get.put(ClueController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const TopBarWidget(),
              const SizedBox(height: 32),
              const Flexible(child: MyGrid()),
              const SizedBox(height: 32),
              ClueWidget(controller: clueController),
              const SizedBox(height: 32),
              const MyCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
