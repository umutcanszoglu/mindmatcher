import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: Get.width / 3,
        height: 40,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("User Name", style: FontStyles.smallButtonBlack),
            avatarIcon,
          ],
        ),
      ),
    );
  }
}
