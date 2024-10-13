import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/edit_quistion_controller.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_desktop_route.dart';
import 'package:quiz/core/shared/app_textformfiled.dart';
import 'package:quiz/view/widget/teacher/edite_quistion/edit_radio_choice.dart';
import 'package:quiz/view/widget/teacher/edite_quistion/row_title.dart';
import 'package:quiz/view/widget/teacher/row_quist_title.dart';

class editQuistion extends StatelessWidget {
  const editQuistion({super.key});

  @override
  Widget build(BuildContext context) {
    editQuistionController controller = Get.put(editQuistionController());
    return AppDesktopRoute(FormKey: controller.formstateEdit, children: [
      RowTitle(
        reminig: controller.remining,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mark".tr + ":  "),
          appTextFF(
            hint: "",
            label: "",
            control: controller.mark,
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
        icon: Icon(Icons.quiz_sharp),
        valid: (val) {
          return validInput(val!, 1, 100, "mark", 10);
        },
        control: controller.quistionEditing,
      ),
      editRadioChoice(vlaue: "a", control: controller.A),
      editRadioChoice(vlaue: "b", control: controller.B),
    controller.q["questions"][controller.index]["choices"].length >=3? 
     editRadioChoice(vlaue: "c", control: controller.C ,novalidate: true, ):Text(""),
    controller.q["questions"][controller.index]["choices"].length ==4? 
     editRadioChoice(vlaue: "d", control: controller.D , novalidate: true,):Text(""),
      Center(
        child: appButton(
            content: "Edit Quistion",
            onTap: () {
              controller.editQuistion();
            }),
      ),
    ]);
  }
}
