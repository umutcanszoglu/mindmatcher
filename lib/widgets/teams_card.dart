import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/team_model.dart';

class TeamsCard extends StatelessWidget {
  const TeamsCard({
    super.key,
    required this.team,
  });
  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: team.teamColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(team.teamName, style: FontStyles.bodyWhite),
          Text(team.wordCount.toString(), style: FontStyles.bodyWhite),
          Text("Operative", style: FontStyles.smallButtonwhite),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("person", style: FontStyles.smallButtonwhite),
              Text("person", style: FontStyles.smallButtonwhite),
              Text("person", style: FontStyles.smallButtonwhite),
            ],
          ),
          Text("Master", style: FontStyles.smallButtonwhite),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("person", style: FontStyles.smallButtonwhite),
            ],
          ),
        ],
      ),
    );
  }
}
