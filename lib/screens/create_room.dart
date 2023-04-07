import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/create_room_card.dart';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              SizedBox(height: 150),
              CreateRoomCard(),
            ],
          ),
        ),
      ),
    );
  }
}
