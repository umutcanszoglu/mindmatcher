import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/info_card.dart';
import 'package:mindmatcher/widgets/players_card.dart';
import 'package:mindmatcher/widgets/reset_card.dart';
import 'package:mindmatcher/widgets/rules_card.dart';
import 'package:mindmatcher/widgets/user_card.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  PlayersCard(),
                  SizedBox(width: 4),
                  ResetCard(),
                  SizedBox(width: 4),
                  RulesCard(),
                  SizedBox(width: 22),
                  UserCard(),
                ],
              ),
              const InfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
