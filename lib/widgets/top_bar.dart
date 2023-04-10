import 'package:flutter/material.dart';
import 'package:mindmatcher/widgets/players_card.dart';
import 'package:mindmatcher/widgets/reset_card.dart';
import 'package:mindmatcher/widgets/rules_card.dart';
import 'package:mindmatcher/widgets/user_card.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PlayersCard(),
        SizedBox(width: 4),
        ResetCard(),
        SizedBox(width: 4),
        RulesCard(),
        SizedBox(width: 22),
        UserCard(),
      ],
    );
  }
}
