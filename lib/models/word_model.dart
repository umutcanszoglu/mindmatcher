// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WordModel {
  String word;
  String type;
  bool isOpen;
  String name;
  WordModel({
    required this.word,
    required this.type,
    required this.isOpen,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'type': type,
      'isOpen': isOpen,
      'name': name,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'] as String,
      type: map['type'] as String,
      isOpen: map['isOpen'] as bool,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
