import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/widgets/clue.dart';
import 'package:mindmatcher/widgets/my_carousel.dart';
import 'package:mindmatcher/widgets/my_grid.dart';
import 'package:mindmatcher/widgets/top_bar.dart';

class GamePage extends StatelessWidget {
  const GamePage(this.gameWords, {super.key});
  final List<WordModel> gameWords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              const TopBarWidget(),
              const SizedBox(height: 32),
              Flexible(child: MyGrid(gameWords: gameWords)),
              const SizedBox(height: 32),
              const ClueWidget(),
              const SizedBox(height: 32),
              const MyCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
