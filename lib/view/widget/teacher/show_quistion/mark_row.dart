// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/show_quistion_controller.dart';
import 'package:quiz/core/constant/app_color.dart';

import 'package:quiz/view/widget/teacher/show_quiz/show_text.dart';

class markRow extends StatelessWidget {
 final double size;
 final int mark;

  const markRow({
    Key? key,
    required this.size,
    required this.mark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showQuistionControllerImp controller = Get.put(showQuistionControllerImp());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showText(
          size: size,
          content: "Quistion Mark is :".tr,
          customColor: appColors.primaryColor,
        ),
        showText(size: size, content: "  $mark")
      ],
    );
  }
}
