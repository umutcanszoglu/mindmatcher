import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/models/player_model.dart';

class Api {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Stream<GameRoomModel> getRoom(String uid) {
    final sp = _firestore.collection("rooms").doc(uid).snapshots();
    return sp.map((e) => GameRoomModel.fromMap(e.data()!));
  }

  static Future<String?> createRoom(GameRoomModel room) async {
    try {
      final roomDoc = _firestore.collection("rooms").doc();
      room.uid = roomDoc.id;
      await roomDoc.set(room.toMap());
      return roomDoc.id;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> createPlayer(Player player) async {
    try {
      final playerDoc = _firestore.collection("players").doc();
      player.uid = playerDoc.id;
      await playerDoc.set(player.toMap());
      return playerDoc.id;
    } catch (_) {
      return null;
    }
  }

  static Future<bool> setRoleTurn(String uid, bool iis) async {
    try {
      await _firestore.collection("rooms").doc(uid).update({"roleTurn": iis});
      return true;
    } catch (_) {
      return false;
    }
  }
}
