// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appButton extends StatelessWidget {
  double? screenWidth;
  double? screenHeight;
  void Function()? onTap;
  bool? isQuiz;
  String content;
  Color? customButtonColor;
  appButton(
      {Key? key,
      this.isQuiz,
      this.customButtonColor,
      required this.content,
      this.screenWidth,
      this.screenHeight,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => GestureDetector(
            onTap: onTap,
            child: Container(
              width: screenWidth ?? diviceInfo.screenWidth * 0.2,
              height: screenHeight ?? diviceInfo.screenHeight * 0.07,
              decoration: BoxDecoration(
                  color: isQuiz == true
                      ? customButtonColor?? appColors.secondaryColor
                      :customButtonColor?? appColors.primaryColor,
                  borderRadius: BorderRadius.circular(appColors.raduce)),
              child: Center(
                  child: Text(
                content.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
            )));
  }
}
