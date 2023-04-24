import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/services/api.dart';

class RoomController extends GetxController {
  StreamSubscription<GameRoomModel>? getRoomHandle;

  final room = Rxn<GameRoomModel>();

  final username = TextEditingController();
  final joinKey = TextEditingController();

  final wordModels = <WordModel>[].obs;

  void createRoom() async {
    final tempRoom = GameRoomModel(
      uid: "",
      creator: "",
      teamTurn: false,
      roleTurn: false,
      players: {},
      gameLogs: [],
      words: [],
    );

    final player = Player(
      name: username.text.trim(),
      role: false,
      team: false,
    );

    tempRoom.creator = player.name;
    tempRoom.players[player.name] = player;
    tempRoom.words = wordModels;

    final uid = await Api.createRoom(tempRoom);

    if (uid != null) {
      listenRoom(uid);
    } else {
      debugPrint("TODO: BURADA HATA YAZDIR");
    }
  }

  void joinRoom() async {
    final player = Player(
      name: username.text.trim(),
      role: false,
      team: false,
    );
    final roomUID = joinKey.text.trim();
    await Api.addPlayerToRoom(roomUID, player);

    listenRoom(roomUID);
  }

  void listenRoom(String uid) {
    getRoomHandle?.cancel();
    getRoomHandle = Api.roomStream(uid).listen((gameRoomModel) {
      room.value = gameRoomModel;
    });
  }

  List<WordModel> fillWordModels(List<String> words) {
    for (int i = 0; i < words.length; i++) {
      if (i >= 24) {
        final model = WordModel(word: words[i], type: "b", isOpen: false);
        wordModels.add(model);
      }
      if (i >= 16 && i < 24) {
        final model = WordModel(word: words[i], type: "w", isOpen: false);
        wordModels.add(model);
      }
      if (i >= 8 && i < 16) {
        final model = WordModel(word: words[i], type: "o", isOpen: false);
        wordModels.add(model);
      }
      if (i < 8) {
        final model = WordModel(word: words[i], type: "p", isOpen: false);
        wordModels.add(model);
      }
    }
    wordModels.shuffle();
    return wordModels;
  }

  @override
  void onClose() {
    username.dispose();
    joinKey.dispose();
    super.onClose();
  }
}
