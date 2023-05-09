import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/category_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 24.h),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text("Category", style: FontStyles.headers, textAlign: TextAlign.center),
                      SizedBox(height: 32.h),
                      Obx(
                        () => SizedBox(
                          width: double.infinity.w,
                          height: (Get.height / 1.6).h,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: controller.categories
                                .asMap()
                                .entries
                                .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(bottom: 8.0.h),
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
                      SizedBox(height: 32.h),
                      MyButton(
                        color: orange,
                        width: double.infinity.w,
                        height: 60.h,
                        text: "Next",
                        textStyle: FontStyles.buttons,
                        onTap: () async {
                          EasyLoading.show(maskType: EasyLoadingMaskType.clear);
                          final words = await controller.getGameWords();
                          if (words.isEmpty) {
                            EasyLoading.showToast(
                              "Select Category",
                              duration: const Duration(seconds: 1),
                            );
                          } else {
                            roomController.wordModels = roomController.getWordModels(words);
                            roomController.createRoom();
                          }
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
