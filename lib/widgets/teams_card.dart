import 'package:flutter/material.dart';
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
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: team.teamColor,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
