import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/create_quiz_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_image.dart';
import 'package:quiz/core/shared/app_smallsized.dart';
import 'package:quiz/core/shared/app_textformfiled.dart';
import 'package:quiz/view/screen/auth/login.dart';
import 'package:quiz/view/screen/teacher/show_quiz.dart';
import 'package:quiz/view/widget/teacher/row_deatils.dart';
import 'package:quiz/view/widget/teacher/show_quiz/visible_icon.dart';

class createQuiz extends StatelessWidget {
  const createQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    CreateQuizControllerImp controller = Get.put(CreateQuizControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: appColors.thirdColor,
          floatingActionButton: GetBuilder<CreateQuizControllerImp>(
              builder: (contoller) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: controller.isExpanded ? 200 : 50,
                      width: 70,
                      decoration: BoxDecoration(
                          color: appColors.primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.isExpanded
                              ? Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.changeStateCircle();
                                    },
                                    child: Icon(Icons.menu),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    controller.changeStateCircle();
                                  },
                                  child: Icon(Icons.menu)), // عنصر 1

                          visibleIcon(
                              isExpanded: controller.isExpanded,
                              icon: Icons.home,
                              onTap: () {},
                              is_currentpage: true,
                              isogOut: false),
                          visibleIcon(
                              isExpanded: controller.isExpanded,
                              icon: Icons.auto_stories_rounded,
                              onTap: () {
                                Get.to(() => showQuiz());
                              },
                              is_currentpage: false,
                              isogOut: false),
                          visibleIcon(
                              isExpanded: controller.isExpanded,
                              icon: Icons.logout,
                              onTap: () {
                                 Get.offAll(() => login());
                              },
                              is_currentpage: false,
                              isogOut: true),
                          contoller.isExpanded
                              ? SizedBox(
                                  height: 8,
                                )
                              : SizedBox(
                                  height: 1,
                                )
                        ],
                      ),
                    ),
                  )),
          body: infoWidget(
            builder: (context,
                    diviceInfo) => //عملت شرط مشان شوف نوع الجهاز وحدد طريقة العرض
                diviceInfo.deviceType == DeviceType.Desktop ||
                        diviceInfo.deviceType == DeviceType.Tablet
                    ? Center(
                        child: Form(
                          key: controller.formstateCreateQ,
                          child: Container(
                            width: diviceInfo.screenWidth * 0.35,
                            margin: EdgeInsets.symmetric(
                              vertical: diviceInfo.screenHeight * 0.018,
                            ),
                            color: Colors.white,
                            child: ListView(
                              children: [
                                appImage(
                                  path: "13261.jpg",
                                  hasFit: false,
                                  customHeight: diviceInfo.localHeight * 0.2,
                                  cutomWidth: diviceInfo.localWidth * 0.2,
                                ),
                                Center(
                                  child: Text(
                                    "Create New Quiz".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                                appSmallSizedBox(
                                    // height: diviceInfo.localHeight
                                    ),
                                GetBuilder<CreateQuizControllerImp>(
                                    builder: (controller) => RowTeacherDetails(
                                        width: diviceInfo.localWidth)),
                                appSmallSizedBox(
                                    //  height: diviceInfo.localHeight
                                    ),
                                appTextFF(
                                  control: controller.title,
                                  valid: (val) {
                                    return validInput(
                                        val!, 3, 100, "title", 10);
                                  },
                                  hint: "Enter Quiz title",
                                  label: "title",
                                  icon: const Icon(Icons.subject_outlined),
                                  // height: diviceInfo.localHeight,
                                  // width: diviceInfo.localWidth,
                                ),
                                appTextFF(
                                  isJustNumber: true,
                                  control: controller.mark,
                                  valid: (val) {
                                    return validInput(val!, 1, 100, "mark", 10);
                                  },
                                  hint: "Enter Quiz mark",
                                  label: "mark",
                                  icon: const Icon(Icons.format_list_numbered),
                                  // height: diviceInfo.localHeight,
                                  //width: diviceInfo.localWidth,
                                ),
                                appTextFF(
                                  isJustNumber: true,
                                  control: controller.time,
                                  valid: (val) {
                                    return validInput(val!, 1, 100, "time", 10);
                                  },
                                  hint: "Enter Quiz time",
                                  label: "time",
                                  icon: const Icon(Icons.timer),
                                  //height: diviceInfo.localHeight,
                                  //width: diviceInfo.localWidth,
                                ),
                                Center(
                                  child: appButton(
                                      content: "Create Quiz".tr,
                                      // screenWidth: diviceInfo.localWidth,
                                      // screenHeight: diviceInfo.localHeight,
                                      onTap: () {
                                        controller.sendQuiz();
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.black,
                        width: double.infinity,
                      ),
          )),
    );
  }
}
