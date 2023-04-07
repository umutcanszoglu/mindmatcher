import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: dirtyWhite,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
          child: Text("there is a many infos in here....", style: FontStyles.smallButtonBlack)),
    );
  }
}
