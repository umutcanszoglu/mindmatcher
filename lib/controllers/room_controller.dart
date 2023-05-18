import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/models/game_log_model.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/models/word_model.dart';
import 'package:mindmatcher/screens/game_page.dart';
import 'package:mindmatcher/screens/result_page.dart';
import 'package:mindmatcher/screens/start_game.dart';
import 'package:mindmatcher/services/api.dart';

class RoomController extends GetxController {
  StreamSubscription<GameRoomModel?>? getRoomHandle;

  final room = Rxn<GameRoomModel>();

  final username = TextEditingController();
  final joinKey = TextEditingController();

  var wordModels = SplayTreeMap<String, WordModel>();

  final visibility = true.obs;

  bool blackKey = false;

  //List<WordModel> get words => room.value!.words;

  Player get user => room.value!.players[myName]!;

  Player? get purpleNarrator {
    try {
      return room.value!.players.entries.firstWhere((t) => t.value.role && t.value.team).value;
    } catch (_) {
      return null;
    }
  }

  Player? get orangeNarrator {
    try {
      return room.value!.players.entries.firstWhere((t) => t.value.role && !t.value.team).value;
    } catch (_) {
      return null;
    }
  }

  String myName = "";

  void createRoom() async {
    final tempRoom = GameRoomModel(
      uid: "",
      creator: "",
      teamTurn: false,
      roleTurn: true,
      players: {},
      gameLogs: [],
      words: SplayTreeMap<String, WordModel>(),
      winner: false,
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
    final res = await Api.addPlayerToRoom(roomUID, player);
    if (!res) {
      EasyLoading.showToast(
        "Incorrect key",
        maskType: EasyLoadingMaskType.black,
        duration: const Duration(seconds: 1),
      );
    }

    listenRoom(roomUID);
  }

  void listenRoom(String uid) {
    getRoomHandle?.cancel();
    getRoomHandle = Api.roomStream(uid).listen(roomUpdate);
  }

  void roomUpdate(GameRoomModel? gameRoomModel) async {
    final wasNull = room.value == null;
    room.value = gameRoomModel;
    if (gameRoomModel == null) return null;
    visibility.value =
        !room.value!.players.entries.any((e) => (user.team == e.value.team) && e.value.role);
    final pL =
        gameRoomModel.words.entries.where((e) => e.value.type == "p" && !e.value.isOpen).length;
    final oL =
        gameRoomModel.words.entries.where((e) => e.value.type == "o" && !e.value.isOpen).length;

    final blackOpen = gameRoomModel.words.entries.any((e) => e.value.type == "b" && e.value.isOpen);

    // if black one opened
    if (blackOpen && !blackKey) {
      blackKey = true;
      await Api.setWinner(room.value?.uid ?? "", !(gameRoomModel.teamTurn));
      Get.to(const ResultPage());
    }
    // if purple's win
    if (pL == 0) {
      await Api.setWinner(room.value?.uid ?? "", true);
      Get.to(const ResultPage());
    }
    // if orange's win
    if (oL == 0) {
      await Api.setWinner(room.value?.uid ?? "", false);
      Get.to(const ResultPage());
    }

    if (wasNull) {
      EasyLoading.dismiss();
      Get.to(const GamePage());
    }
  }

  SplayTreeMap<String, WordModel> getWordModels(List<String> words) {
    final wm = SplayTreeMap<String, WordModel>();
    for (int i = 0; i < words.length; i++) {
      if (i >= 24) {
        final model = WordModel(word: words[i], type: "b", isOpen: false, name: "");
        wm[words[i]] = model;
      }
      if (i >= 16 && i < 24) {
        final model = WordModel(word: words[i], type: "w", isOpen: false, name: "");
        wm[words[i]] = model;
      }
      if (i >= 8 && i < 16) {
        final model = WordModel(word: words[i], type: "o", isOpen: false, name: "");
        wm[words[i]] = model;
      }
      if (i < 8) {
        final model = WordModel(word: words[i], type: "p", isOpen: false, name: "");
        wm[words[i]] = model;
      }
    }

    return wm;
  }

  void switchTeam() {
    if (user.role) {
      Api.switchProblem(room.value?.uid ?? "", user);
      visibility.value = false;
      user.role = false;
    } else {
      Api.switchTeam(room.value?.uid ?? "", user);
    }
  }

  void selectRole(bool role) {
    Api.selectRole(room.value?.uid ?? "", user, role);
    Get.back();
  }

  void changeTeamTurn(bool turn) {
    Api.switchTeamTurn(room.value?.uid ?? "", turn);
  }

  void changeRoleTurn(bool turn) {
    Api.switchRoleTurn(room.value?.uid ?? "", turn);
  }

  void openWord(WordModel word) async {
    final room = this.room.value!;

    if (user.role || room.roleTurn || user.team != room.teamTurn) return;

    final hasOpen = await Api.openWord(room.uid, word.word, user.name);
    log("opened ${word.word}");

    if (hasOpen && ((room.teamTurn && word.type != "p") || (!room.teamTurn && word.type != "o"))) {
      Api.switchTeamTurn(room.uid, !room.teamTurn);
      Api.switchRoleTurn(room.uid, !room.roleTurn);
    }
  }

  void log(String answer) {
    final entity = GameLogModel(team: user.team, role: user.role, name: user.name, answer: answer);
    Api.logToRoom(room.value?.uid ?? "", entity);
  }

  List<String> getPlayersNames() {
    final names = <String>[];

    for (var i = 0; i < room.value!.players.entries.where((e) => e.value.role).length; i++) {
      final res = room.value!.players.entries
          .where((k) => k.value.role)
          .map((e) => e.value.name)
          .elementAt(i);
      names.add(res);
    }
    return names;
  }

  void endGuessing() {
    final room = this.room.value!;

    Api.switchTeamTurn(room.uid, !room.teamTurn);
    Api.switchRoleTurn(room.uid, !room.roleTurn);
  }

  void deleteRoom() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    await getRoomHandle?.cancel();
    await Api.deleteRoom(room.value?.uid ?? "");
    Get.deleteAll();
    Get.off(const StartGamePage());
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    username.dispose();
    joinKey.dispose();
    super.onClose();
  }
}
