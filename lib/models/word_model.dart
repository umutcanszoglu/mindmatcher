import 'package:flutter/material.dart';

class WordModel {
  String word;
  Color color;
  bool? isAnswered;
  bool isSelected;

  WordModel({
    required this.word,
    required this.color,
    this.isAnswered,
    this.isSelected = false,
  });
}
