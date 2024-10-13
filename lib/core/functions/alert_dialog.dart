import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/constant/app_color.dart';

alertDialog(String dialogTitle) {
  
  Get.defaultDialog(
    backgroundColor: appColors.thirdColor,
    title: "",
    textConfirm: "Ok".tr,
    onCancel: () => print("cancleeee"),
    onConfirm: () => print("confirmmmm"),
    content: Column(
      children: [
        Text(
          dialogTitle.tr,
        ),
      ],
    ),
    buttonColor: appColors.primaryColor,
    confirmTextColor: appColors.secondColor,
    cancelTextColor: appColors.secondColor,
  );
}
