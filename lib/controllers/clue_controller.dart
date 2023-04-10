import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/utils/helpers.dart';

class ClueController extends GetxController {
  final clue = TextEditingController();
  final clueCount = TextEditingController();

  @override
  void onClose() {
    clue.dispose();
    clueCount.dispose();
    super.onClose();
  }

  void getClues() {
    Helpers.snackbar(clue.text.trim(), clueCount.text.trim(), purple);
    resetFields();
  }

  void resetFields() {
    clue.text = "";
    clueCount.text = "";
  }
}
