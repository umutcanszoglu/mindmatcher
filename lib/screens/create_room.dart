import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mindmatcher/consts/icons.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/controllers/category_controller.dart';
import 'package:mindmatcher/controllers/room_controller.dart';
import 'package:mindmatcher/screens/category_page.dart';
import 'package:mindmatcher/widgets/my_button.dart';
import 'package:mindmatcher/widgets/my_textfield.dart';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());

    final controller = Get.put(RoomController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0.w),
            child: ListView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                Text(
                  "CREATE",
                  style: FontStyles.headers,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "ROOM",
                  style: FontStyles.headers.copyWith(color: orange),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 64.h),
                Lottie.asset("assets/lotties/create.json"),
                MyTextField(
                  controller: controller.username,
                  prefixIcon: nicknameIcon,
                  prefixIconColor: orange,
                  hintText: "username",
                  borderColor: dirtyWhite,
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                        color: orange,
                        text: "Create",
                        height: 60.h,
                        textStyle: FontStyles.buttons,
                        onTap: () {
                          final name = controller.username.text.trim().replaceAll(".", "");

                          if (name.isEmpty) {
                            EasyLoading.showToast(
                              "Please enter username.",
                              duration: const Duration(seconds: 1),
                              maskType: EasyLoadingMaskType.black,
                            );
                          } else {
                            if (name.length > 8) {
                              EasyLoading.showToast(
                                "your username cannot be more than 8 characters",
                                duration: const Duration(seconds: 1),
                                maskType: EasyLoadingMaskType.black,
                              );
                            } else {
                              Get.to(const CategoryPage());
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: MyButton(
                        borderColor: purple,
                        color: white,
                        text: "Join",
                        height: 60.h,
                        textStyle: FontStyles.buttonsPurple,
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                              actionsPadding:
                                  EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                              actionsAlignment: MainAxisAlignment.center,
                              backgroundColor: dirtyWhite,
                              title: Text(
                                "Enter The Code",
                                style: FontStyles.bodyBlack,
                                textAlign: TextAlign.center,
                              ),
                              content: MyTextField(
                                controller: controller.joinKey,
                                isFilled: true,
                                fillColor: white,
                                prefixIcon: keyIcon,
                                borderColor: dirtyWhite,
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyButton(
                                        text: "Back",
                                        textStyle: FontStyles.smallButtonPurple,
                                        color: Colors.transparent,
                                        borderColor: purple,
                                        width: double.infinity,
                                        height: 40.h,
                                        onTap: Get.back,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: MyButton(
                                        text: "Join",
                                        textStyle: FontStyles.smallButtonwhite,
                                        color: orange,
                                        width: double.infinity,
                                        height: 40.h,
                                        onTap: controller.join,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}
