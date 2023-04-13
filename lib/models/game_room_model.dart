// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mindmatcher/models/game_log_model.dart';
import 'package:mindmatcher/models/player_model.dart';

class GameRoomModel {
  String creator;
  List<Player> players;
  bool teamTurn;
  bool roleTurn;
  List<GameLogModel> gameLogs;
  GameRoomModel({
    required this.creator,
    required this.players,
    required this.teamTurn,
    required this.roleTurn,
    required this.gameLogs,
  });
}
