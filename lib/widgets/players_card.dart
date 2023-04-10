import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';

class PlayersCard extends StatelessWidget {
  const PlayersCard({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width / 7,
        height: 40,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            playersIcon,
            const SizedBox(width: 5),
            Text("15", style: FontStyles.smallButtonBlack),
          ],
        ),
      ),
    );
  }
}
