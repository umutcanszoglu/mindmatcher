import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class TeamsCard extends StatelessWidget {
  const TeamsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Team Name", style: FontStyles.bodyWhite),
          Text("8", style: FontStyles.bodyWhite),
          Text("Operative", style: FontStyles.smallButtonwhite),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("person", style: FontStyles.smallButtonwhite),
              Text("person", style: FontStyles.smallButtonwhite),
              Text("person", style: FontStyles.smallButtonwhite),
            ],
          ),
          Text("Master", style: FontStyles.smallButtonwhite),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("person", style: FontStyles.smallButtonwhite),
            ],
          ),
        ],
      ),
    );
  }
}
