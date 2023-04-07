import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/theme.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 50,
          top: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 56),
              decoration: const BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Text(
                "English",
                style: FontStyles.bodyWhite,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: orange, width: 3),
              color: orange,
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/english.png"),
          ),
        ),
      ],
    );
  }
}
