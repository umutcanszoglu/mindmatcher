import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameLogModel {
  bool team;
  bool role;
  String name;
  String answer;
  GameLogModel({
    required this.team,
    required this.role,
    required this.name,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'team': team,
      'role': role,
      'name': name,
      'answer': answer,
    };
  }

  factory GameLogModel.fromMap(Map<String, dynamic> map) {
    return GameLogModel(
      team: map['team'] as bool,
      role: map['role'] as bool,
      name: map['name'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameLogModel.fromJson(String source) =>
      GameLogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
