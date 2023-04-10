import 'package:flutter/material.dart';

class TeamsCard extends StatelessWidget {
  const TeamsCard({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
