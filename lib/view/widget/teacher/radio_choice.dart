// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:quiz/controller/teacher/create_quistion_controller.dart';
import 'package:quiz/controller/teacher/show_quistion_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/shared/app_textformfiled.dart';

// ignore: must_be_immutable
class RadioChoice extends StatelessWidget {
  String vlaue;
  TextEditingController control;
  bool cOrd;
  RadioChoice({
    Key? key,
    required this.vlaue,
    required this.control,
    required this.cOrd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateQuistionImp>(
      builder: (controller) => RadioListTile(
        value: vlaue,
        groupValue: controller.z,
        onChanged: (val) {
          controller.changeRadio(val.toString());
          print("in radio choice ${controller.z.toLowerCase()}");
        },
        activeColor: appColors.secondaryColor,
        title: appTextFF(
            isChoice: true,
            hint: vlaue.toUpperCase(),
            label: "",
            control: control,
            icon: Icon(Icons.check_box_outline_blank_rounded),
            valid: (val) {
              return validInput(val!,cOrd?0: 1, 100, cOrd?"c":"nn", 10);
            }),
      ),
    );
  }
}
