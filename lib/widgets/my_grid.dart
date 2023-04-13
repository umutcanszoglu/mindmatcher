import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap:
          true, // belirli bir boy yoksa boy varmış gibi gösterir. col içinde listview vb kullanacksan vereceksin.
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        maxCrossAxisExtent: Get.width * 0.2,
      ),
      children: const [],
    );
  }
}
