import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/models/player_model.dart';

class Api {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Stream<GameRoomModel> roomStream(String uid) {
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
      debugPrint("hata");
      return "x";
    }
  }

  static Future<GameRoomModel?> getRoom(String uid) async {
    try {
      final room = await _firestore.collection("rooms").doc(uid).get();
      final data = room.data();

      if (data == null) return null;

      return GameRoomModel.fromMap(data);
    } catch (_) {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getWords(String uid) async {
    try {
      final words = await _firestore.collection("words").doc(uid).get();
      final data = words.data();

      if (data == null) return null;

      return data;
    } catch (_) {
      return null;
    }
  }

  static Future<List<String>> getCategories() async {
    try {
      final words = await _firestore.collection("words").get();
      final categories = words.docs.map((e) => e.id).toList();

      return categories;
    } catch (_) {
      return [];
    }
  }

  static Future<bool> addPlayerToRoom(String roomUid, Player player) async {
    try {
      await _firestore
          .collection("rooms")
          .doc(roomUid)
          .update({"players.${player.name}": player.toMap()});
      return true;
    } catch (_) {
      return false;
    }
  }
}
