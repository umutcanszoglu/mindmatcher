import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClueController extends GetxController {
  final clue = TextEditingController();
  final count = TextEditingController();

  @override
  void onClose() {
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

  void resetFields() {
    clue.text = "";
    count.text = "";
  }
}
