import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClueController extends GetxController {
  final clue = TextEditingController();
  final count = TextEditingController();

  final clueText = "".obs;

  @override
  void onInit() {
    clue.addListener(listener);
    super.onInit();
  }

  @override
  void onClose() {
    clue.removeListener(listener);
    clue.dispose();
    count.dispose();
    super.onClose();
  }

  String getClue() {
    if (count.text.trim() == "") {
      count.text = "0";
    }
    return "${clue.text.trim()} - ${count.text.trim()}";
  }

  void listener() {
    clueText.value = clue.text.trim();
  }

  void resetFields() {
    clue.text = "";
    count.text = "";
  }
}
