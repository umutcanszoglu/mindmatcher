import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/category_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/screens/game_page.dart';
import 'package:mindmatcher/widgets/category_card.dart';
import 'package:mindmatcher/widgets/my_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final roomController = Get.find<RoomController>();

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text("Category", style: FontStyles.headers, textAlign: TextAlign.center),
                      const SizedBox(height: 32),
                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: Get.height / 1.6,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: controller.categories
                                .asMap()
                                .entries
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: CategoryCard(
                                      model: e.value,
                                      onTap: () {
                                        e.value.isSelected = !e.value.isSelected;
                                        controller.categories.refresh();
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      MyButton(
                        color: orange,
                        width: double.infinity,
                        height: 60,
                        text: "Next",
                        textStyle: FontStyles.buttons,
                        onTap: () async {
                          EasyLoading.show(maskType: EasyLoadingMaskType.clear);
                          final words = await controller.getGameWords();
                          EasyLoading.dismiss();
                          roomController.fillWordModels(words);
                          roomController.createRoom();
                          Get.to(GamePage(roomController.room.value!.words));
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
