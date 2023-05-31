import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/category_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/screens/exit_page.dart';
import 'package:mindmatcher/services/api.dart';
import 'package:mindmatcher/widgets/game_log.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/players_card.dart';
import 'package:mindmatcher/widgets/rules.dart';
import 'package:mindmatcher/widgets/rules_card.dart';
import 'package:mindmatcher/widgets/user_card.dart';
import 'package:share_plus/share_plus.dart';

class TopBarWidget extends GetView<RoomController> {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final catController = Get.find<CategoryController>();
    return Row(
      children: [
        //Players
        PlayersCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  "Players",
                  style: FontStyles.header2.copyWith(color: black),
                  textAlign: TextAlign.center,
                ),
                content: Obx(
                  () => Wrap(
                    spacing: 8,
                    children: [
                      ...controller.room.value!.players.entries.map(
                        (e) => Chip(
                          elevation: 3.0,
                          backgroundColor: white,
                          shadowColor: black,
                          avatar:
                              Icon(Icons.circle, size: 20, color: e.value.team ? purple : orange),
                          label: Text(
                            e.value.name,
                            style: FontStyles.smallButtonBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  MyButton(
                    text: "Invite",
                    textStyle: FontStyles.buttons,
                    color: green,
                    height: 50.h,
                    onTap: () {
                      Share.share(controller.room.value?.uid ?? "");
                    },
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(delay: 300.ms, duration: 1800.ms)
                ],
              ),
            );
          },
        ),
        SizedBox(width: 8.w),
        //GameLog
        GameLogCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Game",
                      style: FontStyles.header2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Logs",
                      style: FontStyles.header2.copyWith(color: orange),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: dirtyWhite,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListView(
                        physics:
                            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          if (controller.room.value!.gameLogs.isNotEmpty)
                            ...controller.room.value!.gameLogs.map(
                              (kv) => Text(
                                "${kv.name} / ${kv.answer}",
                                style:
                                    FontStyles.bodyBlack.copyWith(color: kv.team ? purple : orange),
                                textAlign: TextAlign.center,
                              ),
                            )
                          else
                            Column(
                              children: [
                                Lottie.asset("assets/lotties/empty.json", height: 200),
                                Text(
                                  "There isn't logs in here yet.",
                                  style: FontStyles.bodyBlack,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(width: 8.w),
        //Rules
        RulesCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MIND",
                      style: FontStyles.header2,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "MATCHER",
                      style: FontStyles.header2.copyWith(color: orange),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: 300.w,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Rules(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const Spacer(),
        //User
        UserCard(
          onTap: () {
            Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                actionsPadding: EdgeInsets.only(bottom: 16.h),
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: white,
                title: Text(
                  controller.user.name == controller.room.value!.creator
                      ? "♛ ${controller.user.name}'s Room ♛"
                      : "${controller.user.name}'s Profile",
                  style: FontStyles.bodyBlack,
                  textAlign: TextAlign.center,
                ),
                content: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.user.team ? "Team: Purple" : "Team: Orange",
                        style: FontStyles.bodyBlack
                            .copyWith(color: controller.user.team ? purple : orange),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        controller.user.role ? "Role: Narrator" : "Role: Predictor",
                        style: FontStyles.bodyBlack.copyWith(
                            color: controller.user.role ? const Color(0xff3F497F) : green),
                      ),
                      SizedBox(height: 16.h),
                      MyButton(
                        color: controller.user.team ? purple : orange,
                        text: "Switch Team",
                        width: 180.w,
                        height: 40.h,
                        textStyle: FontStyles.buttons
                            .copyWith(color: controller.user.team ? white : black),
                        onTap: () {
                          controller.switchTeam();
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text("Select Role", style: FontStyles.bodyBlack),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          if (controller.visibility.value)
                            Expanded(
                              child: MyButton(
                                color: const Color(0xff3F497F),
                                text: "Narrator",
                                width: 120.w,
                                height: 40.h,
                                textStyle: FontStyles.buttons,
                                onTap: () {
                                  controller.selectRole(true);
                                },
                              ),
                            ),
                          if (controller.visibility.value) SizedBox(width: 8.w),
                          if (!controller.visibility.value)
                            Expanded(
                              child: MyButton(
                                color: green,
                                text: "Predictor",
                                width: 120.w,
                                height: 40.h,
                                textStyle: FontStyles.buttons,
                                onTap: () {
                                  controller.selectRole(false);
                                },
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      if (controller.user.name == controller.room.value!.creator)
                        Row(
                          children: [
                            Expanded(
                              child: MyButton(
                                text: "Reset",
                                textStyle: FontStyles.buttons
                                    .copyWith(color: controller.user.team ? white : black),
                                color: controller.user.team ? purple : orange,
                                width: double.infinity,
                                height: 40.h,
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      actionsPadding:
                                          EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                                      actionsAlignment: MainAxisAlignment.center,
                                      backgroundColor: white,
                                      title: Text(
                                        "Reset",
                                        style: FontStyles.header2.copyWith(color: black),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Row(
                                        children: [
                                          Expanded(
                                            child: MyButton(
                                              text: "Reset",
                                              textStyle: FontStyles.buttons.copyWith(color: white),
                                              color: red,
                                              width: double.infinity,
                                              height: 40.h,
                                              onTap: () async {
                                                EasyLoading.show(
                                                    maskType: EasyLoadingMaskType.black);

                                                final words = await catController.getGameWords();

                                                await Api.resetWords(
                                                    controller.room.value?.uid ?? "",
                                                    controller.getWordModels(words),
                                                    controller.getPlayersNames());
                                                EasyLoading.dismiss();

                                                Get.back();
                                                Get.back();
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Expanded(
                                            child: MyButton(
                                              text: "Back",
                                              textStyle: FontStyles.buttons.copyWith(color: white),
                                              color: green,
                                              width: double.infinity,
                                              height: 40.h,
                                              onTap: Get.back,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: MyButton(
                                text: "Exit",
                                textStyle: FontStyles.buttons.copyWith(color: white),
                                color: red,
                                width: double.infinity,
                                height: 40.h,
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      actionsPadding:
                                          EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                                      actionsAlignment: MainAxisAlignment.center,
                                      backgroundColor: white,
                                      title: Text(
                                        "Exit",
                                        style: FontStyles.header2.copyWith(color: black),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Row(
                                        children: [
                                          Expanded(
                                            child: MyButton(
                                              text: "Exit",
                                              textStyle: FontStyles.buttons.copyWith(color: white),
                                              color: red,
                                              width: double.infinity,
                                              height: 40.h,
                                              onTap: () {
                                                Get.to(const ExitPage());
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Expanded(
                                            child: MyButton(
                                              text: "Back",
                                              textStyle: FontStyles.buttons.copyWith(color: white),
                                              color: green,
                                              width: double.infinity,
                                              height: 40.h,
                                              onTap: Get.back,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
