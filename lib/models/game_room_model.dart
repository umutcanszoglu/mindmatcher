// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mindmatcher/models/game_log_model.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';

class GameRoomModel {
  String uid;
  String creator;
  bool teamTurn;
  bool roleTurn;
  List<Player> players;
  List<GameLogModel> gameLogs;
  List<WordModel> words;
  GameRoomModel({
    required this.uid,
    required this.creator,
    required this.players,
    required this.teamTurn,
    required this.roleTurn,
    required this.gameLogs,
    required this.words,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'creator': creator,
      'players': players.map((x) => x.toMap()).toList(),
      'teamTurn': teamTurn,
      'roleTurn': roleTurn,
      'gameLogs': gameLogs.map((x) => x.toMap()).toList(),
      'words': words.map((x) => x.toMap()).toList(),
    };
  }

  factory GameRoomModel.fromMap(Map<String, dynamic> map) {
    return GameRoomModel(
      creator: map['creator'] as String,
      uid: map['uid'] as String,
      players: List<Player>.from(
        (map['players'] as List<dynamic>).map<Player>(
          (x) => Player.fromMap(x as Map<String, dynamic>),
        ),
      ),
      teamTurn: map['teamTurn'] as bool,
      roleTurn: map['roleTurn'] as bool,
      gameLogs: List<GameLogModel>.from(
        (map['gameLogs'] as List<dynamic>).map<GameLogModel>(
          (x) => GameLogModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      words: List<WordModel>.from(
        (map['words'] as List<dynamic>).map<WordModel>(
          (x) => WordModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameRoomModel.fromJson(String source) =>
      GameRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
