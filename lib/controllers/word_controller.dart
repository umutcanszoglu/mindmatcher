import 'dart:math';

import 'package:get/get.dart';
import 'package:mindmatcher/consts/const.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/models/word_model.dart';

class WordController extends GetxController {
  final wordModels = <WordModel>[].obs;

  @override
  void onInit() {
    getWords();
    super.onInit();
  }

  void getWords() {
    final temp = <String>[];
    temp.addAll(Const.randomWords);

    for (int i = 0; i < 25; i++) {
      final num = Random().nextInt(temp.length);
      final word = temp.removeAt(num);

      if (i < 8) {
        final entity = WordModel(word: word, color: purple);
        wordModels.add(entity);
      }
      if (i >= 8 && i < 16) {
        final entity = WordModel(word: word, color: orange);
        wordModels.add(entity);
      }
      if (i >= 16 && i < 24) {
        final entity = WordModel(word: word, color: blue);
        wordModels.add(entity);
      }
      if (i >= 24) {
        final entity = WordModel(word: word, color: black);
        wordModels.add(entity);
      }
    }
    wordModels.shuffle();
  }
}
