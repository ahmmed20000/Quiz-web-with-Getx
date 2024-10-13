import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/show_quiz_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/send_ecxil_file.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_sizedbox.dart';
import 'package:quiz/core/shared/app_smallsized.dart';
import 'package:quiz/view/screen/auth/login.dart';
import 'package:quiz/view/screen/teacher/create_quiz.dart';
import 'package:quiz/view/screen/teacher/show_quistion.dart';
import 'package:quiz/view/widget/teacher/show_quiz/show_quiz_buttons.dart';
import 'package:quiz/view/widget/teacher/show_quiz/visible_icon.dart';
import 'package:quiz/view/widget/teacher/show_quiz_cancle_button.dart';
import 'package:quiz/view/widget/teacher/show_quiz/show_text.dart';

class showQuiz extends StatelessWidget {
  const showQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    showQuizControllerImp controller = Get.put(showQuizControllerImp());
    MediaQueryData m = MediaQueryData();
    return Scaffold(
      backgroundColor: appColors.thirdColor,
      floatingActionButton: GetBuilder<showQuizControllerImp>(
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
                                child: Container(child: Icon(Icons.menu)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.changeStateCircle();
                              },
                              child:
                                  Container(child: Icon(Icons.menu))), // عنصر 1

                      visibleIcon(
                          isExpanded: controller.isExpanded,
                          icon: Icons.home,
                          onTap: () {
                            Get.off(createQuiz());
                          },
                          is_currentpage: false,
                          isogOut: false),
                      visibleIcon(
                          isExpanded: controller.isExpanded,
                          icon: Icons.auto_stories_rounded,
                          onTap: () {},
                          is_currentpage: true,
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
        builder: (context, diviceInfo) => GetBuilder<showQuizControllerImp>(
            builder: (showQuizControllerImp controller) => controller
                        .responseData.length ==
                    0
                ? Center(
                    child: Text("there are no data",
                        style: Theme.of(context).textTheme.headlineMedium))
                : GridView.builder(
                    itemCount: controller.responseData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: diviceInfo.localWidth * 0.01,
                        mainAxisSpacing: diviceInfo.localHeight * 0.02),
                    itemBuilder: (context, i) {
                      final items = controller.responseData[i]["id"];
                      return Container(
                        width: double.infinity,
                        key: ValueKey(
                            items), //استخدمت معرف فريد لكل عنصر مشان عملية الحذف
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(appColors.raduce),
                            border:
                                Border.all(color: appColors.secondaryColor)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              cancleButton(
                                  val: controller.switchValue[i],
                                  contoller: controller,
                                  index: i,
                                  onPressed: () {
                                    controller.checkCancle(i, items);
                                  },
                                  width: diviceInfo.localWidth),
                              appSmallSizedBox(),
                              showText(
                                content: "${"Quiz ID is :".tr}$items",
                                size: diviceInfo.localWidth,
                              ),
                              showText(
                                size: diviceInfo.localWidth,
                                content:
                                    '''${"Quiz title is:".tr} ${controller.responseData[i]["title"]}''',
                              ),
                              diviceInfo.deviceType == DeviceType.Desktop
                                  ? showText(
                                      size: diviceInfo.localWidth,
                                      content:
                                          "${"Quiz mark:".tr} ${controller.responseData[i]["mark"]}")
                                  : Text(""),
                              diviceInfo.deviceType == DeviceType.Desktop
                                  ? showText(
                                      size: diviceInfo.localWidth,
                                      content:
                                          "${"Quiz time:".tr} ${controller.responseData[i]["duration"]} ${"minute".tr}")
                                  : Text(""),
                              /* showText(
                                size: diviceInfo.localWidth,
                                content: "Quiz title is my first Quiz"),*/

                              showButtons(
                                  height: diviceInfo.localHeight,
                                  width: diviceInfo.localWidth,
                                  onTapAddStudents: () async {
                                    controller.excelResult[i] =
                                        await convertExcelToJsonAndSendToApi(
                                            controller.responseData[i]["id"]);
                                  },
                                  onTapShowDetailes: () {
                                    Get.off(() => showQuistion(),
                                        arguments: controller.showDetailes(
                                            i) //هون ببعث رقم اختبار الي بدي عدل عليه
                                        );
                                  }),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
