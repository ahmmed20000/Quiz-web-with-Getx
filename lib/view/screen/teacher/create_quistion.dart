import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/create_quistion_controller.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_desktop_route.dart';
import 'package:quiz/core/shared/app_smallsized.dart';

import 'package:quiz/core/shared/app_textformfiled.dart';
import 'package:quiz/view/widget/teacher/radio_choice.dart';
import 'package:quiz/view/widget/teacher/row_quist_title.dart';

class createQuestion extends StatelessWidget {
  const createQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    CreateQuistionImp controller = Get.put(CreateQuistionImp());
    return AppDesktopRoute(
      FormKey: controller.formstateCreateQuition, 
      children: [
      RowQuistionTitle(
        mark: controller.mark,
        time: controller.time,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mark".tr + ":  "),
          appTextFF(
            hint: "",
            label: "",
            control: controller.m,
            icon: Icon(Icons.abc_outlined),
            valid: (val) {
              return validInput(val!, 1, 100, "mark", 10);
            },
            isJustNumber: true,
            isMark: true,
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      appTextFF(
          hint: "write the Quistion".tr,
          label: "Quistion".tr,
          control: controller.qus,
          icon: Icon(Icons.quiz_sharp),
          valid: (val) {
            return validInput(val!, 1, 100, "mark", 10);
          }),
      RadioChoice(vlaue: "a" , control: controller.A, cOrd: false,),
      RadioChoice(vlaue: "b", control: controller.B, cOrd: false),
      RadioChoice(vlaue: "c", control: controller.C, cOrd: true),
      RadioChoice(vlaue: "d" , control: controller.D, cOrd: true),
      Center(
        child: appButton(
            content: "Send Quistion",
            onTap: () {
              controller.sendQuistion();
            }),
      ),
          
          appSmallSizedBox(), 

      Center(
        child: appButton(
          isQuiz: true,
            content: "Send Quiz",
            onTap: () {
              controller.sendQuiz();
            }),
      )
    ]);
  }
}
