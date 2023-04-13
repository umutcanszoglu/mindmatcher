import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:mindmatcher/models/game_room_model.dart';
import 'package:mindmatcher/services/api.dart';

class RoomController extends GetxController {
  StreamSubscription<GameRoomModel>? getRoomHandle;

  final room = Rxn<GameRoomModel>();

  void createRoom() async {
    final room = GameRoomModel(
      uid: "",
      creator: "",
      teamTurn: false,
      roleTurn: false,
      players: [],
      gameLogs: [],
      words: [],
    );
    final uid = await Api.createRoom(room);

    if (uid != null) {
      listenRoom(uid);
    } else {
      print("TODO: BURADA HATA YAZDIR");
    }
  }

  void listenRoom(String uid) {
    getRoomHandle?.cancel();
    getRoomHandle = Api.getRoom(uid).listen((event) {
      room.value = event;
    });
  }
}
