import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Player {
  String uid;
  String name;
  bool role;
  bool team;
  Player({
    required this.uid,
    required this.name,
    required this.role,
    required this.team,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'role': role,
      'team': team,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      uid: map['uid'] as String,
      name: map['name'] as String,
      role: map['role'] as bool,
      team: map['team'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) =>
      Player.fromMap(json.decode(source) as Map<String, dynamic>);
}
