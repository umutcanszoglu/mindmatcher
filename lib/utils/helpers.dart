import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';

class Helpers {
  static void snackbar(String title, String msg, Color color) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      colorText: white,
      margin: const EdgeInsets.all(20),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
  }
}
