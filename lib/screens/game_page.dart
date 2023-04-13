import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/clue.dart';
import 'package:mindmatcher/widgets/my_carousel.dart';
import 'package:mindmatcher/widgets/my_grid.dart';
import 'package:mindmatcher/widgets/top_bar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: const [
              TopBarWidget(),
              SizedBox(height: 32),
              Flexible(child: MyGrid()),
              SizedBox(height: 32),
              ClueWidget(),
              SizedBox(height: 32),
              MyCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
