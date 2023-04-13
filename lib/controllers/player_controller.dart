import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/models/player_model.dart';
import 'package:mindmatcher/services/api.dart';

class PlayerController extends GetxController {
  final username = TextEditingController();

  @override
  void onClose() {
    username.dispose();
    super.onClose();
  }

  void createPlayer() async {
    final player = Player(
      uid: "",
      name: username.text.trim(),
      role: false,
      team: false,
    );
    await Api.createPlayer(player);
  }
}
