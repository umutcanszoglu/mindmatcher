import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/screens/game_page.dart';
import 'package:mindmatcher/services/api.dart';

class RoomController extends GetxController {
  StreamSubscription<GameRoomModel>? getRoomHandle;

  final room = Rxn<GameRoomModel>();

  final username = TextEditingController();
  final joinKey = TextEditingController();

  final wordModels = <WordModel>[];

  //List<WordModel> get words => room.value!.words;

  Player get user => room.value!.players[myName]!;

  Player? get purpleNarrator {
    try {
      return room.value!.players.entries
          .firstWhere((t) => t.value.role == true && t.value.team == true)
          .value;
    } catch (_) {
      return null;
    }
  }

  Player? get orangeNarrator {
    try {
      return room.value!.players.entries
          .firstWhere((t) => t.value.role == true && t.value.team == false)
          .value;
    } catch (_) {
      return null;
    }
  }

  late final String myName;

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

    myName = username.text.trim();

    final player = Player(
      name: myName,
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
    myName = username.text.trim();
    final player = Player(
      name: myName,
      role: false,
      team: false,
    );

    final roomUID = joinKey.text.trim();
    await Api.addPlayerToRoom(roomUID, player);

    listenRoom(roomUID);
  }

  void listenRoom(String uid) {
    getRoomHandle?.cancel();
    getRoomHandle = Api.roomStream(uid).listen(roomUpdate);
  }

  void roomUpdate(GameRoomModel gameRoomModel) {
    final wasNull = room.value == null;
    room.value = gameRoomModel;

    if (wasNull) {
      EasyLoading.dismiss();
      Get.to(const GamePage());
    }
  }

  void fillWordModels(List<String> words) {
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
  }

  void switchTeam() {
    Api.switchTeam(room.value?.uid ?? "", user);
  }

  void selectRole(bool role) {
    Api.selectRole(room.value?.uid ?? "", user, role);
    Get.back();
  }

  @override
  void onClose() {
    username.dispose();
    joinKey.dispose();
    super.onClose();
  }
}
