// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mindmatcher/models/player_model.dart';

class TeamModel {
  String teamName;
  int wordCount;
  Color teamColor;
  List<Player> players;
  TeamModel({
    required this.teamName,
    required this.wordCount,
    required this.teamColor,
    required this.players,
  });
}
