import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';

class ResetCard extends StatelessWidget {
  const ResetCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: Get.width / 6,
        height: 40,
        decoration: BoxDecoration(
          color: dirtyWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(child: Text("Reset", style: FontStyles.smallButtonBlack)),
      ),
    );
  }
}
