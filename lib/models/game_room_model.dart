// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import 'dart:convert';

import 'package:mindmatcher/models/game_log_model.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';

class GameRoomModel {
  String uid;
  String creator;
  bool teamTurn;
  bool roleTurn;
  Map<String, Player> players;
  Map<String, GameLogModel> gameLogs;
  SplayTreeMap<String, WordModel> words;
  bool winner;

  GameRoomModel({
    required this.uid,
    required this.creator,
    required this.players,
    required this.teamTurn,
    required this.roleTurn,
    required this.gameLogs,
    required this.words,
    required this.winner,
  });

  String toJson() => json.encode(toMap());

  factory GameRoomModel.fromJson(String source) => GameRoomModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'creator': creator});
    result.addAll({'teamTurn': teamTurn});
    result.addAll({'roleTurn': roleTurn});
    result.addAll({'players': players.map((key, value) => MapEntry(key, value.toMap()))});
    result.addAll({'gameLogs': gameLogs.map((key, value) => MapEntry(key, value.toMap()))});
    result.addAll({'words': words.map((key, value) => MapEntry(key, value.toMap()))});
    result.addAll({'winner': winner});

    return result;
  }

  factory GameRoomModel.fromMap(Map<String, dynamic> map) {
    return GameRoomModel(
      uid: map['uid'] ?? '',
      creator: map['creator'] ?? '',
      teamTurn: map['teamTurn'] ?? false,
      roleTurn: map['roleTurn'] ?? false,
      players:
          Map<String, Player>.from(map['players'].map((k, v) => MapEntry(k, Player.fromMap(v)))),
      gameLogs: Map<String, GameLogModel>.from(
          map['gameLogs'].map((k, v) => MapEntry(k, GameLogModel.fromMap(v)))),
      words: SplayTreeMap<String, WordModel>.from(
          map['words'].map((k, v) => MapEntry(k, WordModel.fromMap(v)))),
      winner: map['winner'] ?? false,
    );
  }
}
