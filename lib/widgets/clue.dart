import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/clue_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/widgets/end_guessing.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';
import 'package:type_text/type_text.dart';

class ClueWidget extends StatelessWidget {
  const ClueWidget({
    super.key,
    required this.controller,
  });
  final RoomController controller;
  @override
  Widget build(BuildContext context) {
    final clueController = Get.put(ClueController());
    return Obx(
      () {
        final color = controller.room.value?.teamTurn ?? false ? purple : orange;

        return Visibility(
          visible: controller.user.role && controller.room.value!.teamTurn == controller.user.team,
          replacement: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            duration: const Duration(milliseconds: 300),
            width: double.infinity.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !controller.user.role && !controller.room.value!.roleTurn
                    ? SizedBox(width: 32.w)
                    : SizedBox(width: 0.w),
                TypeText(
                  duration: const Duration(seconds: 1),
                  controller.room.value!.gameLogs.isEmpty
                      ? "github/umutcanszoglu"
                      : "${controller.room.value!.teamTurn ? "Purple" : "Orange"} / ${controller.room.value!.roleTurn ? "narrator" : controller.room.value!.gameLogs.where((element) => element.role).last.answer}",
                  style: FontStyles.bodyWhite
                      .copyWith(color: controller.room.value?.teamTurn ?? false ? white : black),
                ),
                !controller.user.role && !controller.room.value!.roleTurn
                    ? const Spacer()
                    : SizedBox(width: 0.w),
                !controller.user.role && !controller.room.value!.roleTurn
                    ? EndGuessing(
                        onTap: () {
                          controller.endGuessing();
                        },
                      )
                    : SizedBox(width: 0.w),
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: MyTextField(
                  controller: clueController.clue,
                  prefixIcon: infoIcon,
                  prefixIconColor: color,
                  borderColor: white,
                  hintText: "Enter your clue.",
                  limit: 8,
                  counter: const SizedBox(),
                ),
              ),
              SizedBox(width: 4.w),
              SizedBox(
                width: 90.w,
                child: MyTextField(
                  controller: clueController.count,
                  hintText: "0",
                  prefixIcon: numberIcon,
                  prefixIconColor: color,
                  borderColor: white,
                  keyboardType: TextInputType.number,
                  limit: 2,
                  counter: const SizedBox(),
                ),
              ),
              SizedBox(width: 8.w),
              MyButton(
                onTap: () {
                  if (controller.room.value!.teamTurn == controller.user.team &&
                      controller.room.value!.roleTurn) {
                    if (controller.room.value!.words.entries.any((e) => e.value.word
                        .toLowerCase()
                        .contains(clueController.clue.text.trim().toLowerCase()))) {
                      EasyLoading.showToast("Your clue contains some game words!");
                    } else {
                      controller.changeRoleTurn(false);
                      controller.log(clueController.getClue());
                      clueController.resetFields();
                      EasyLoading.showToast("success");
                    }
                  } else {
                    if (controller.room.value!.teamTurn != controller.user.team) {
                      EasyLoading.showToast("Not your turn");
                    } else {
                      EasyLoading.showToast("Predictor's Turn");
                    }
                  }
                },
                width: 60.w,
                height: 60.h,
                color: color,
                text: "Give",
                textStyle: FontStyles.smallButtonwhite,
              ),
            ],
          ),
        );
      },
    );
  }
}
