// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/show_quistion_controller.dart';
import 'package:quiz/controller/teacher/show_quiz_controller.dart';

import 'package:quiz/core/constant/app_color.dart';

// ignore: must_be_immutable
class cancleButton extends StatelessWidget {
  Function()? onPressed;
  showQuizControllerImp contoller;
  final double width;
  int index;
  bool val;
  cancleButton({
    Key? key,
    this.onPressed,
    required this.contoller,
    required this.width,
    required this.index,
    required this.val,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width*0.016
        ),
        Text(
          "Active".tr, 
          style: Theme.of(context).textTheme.bodyMedium,
          ),
       GetBuilder<showQuizControllerImp>(
        init:showQuizControllerImp() ,
        builder:(contoller)=> Switch(
          
            value:contoller.switchValue[index] ,
            //contoller.responseData[index]["is_active"]==1&& contoller.switchValue[index]==false?!contoller.switchValue[index]:contoller.switchValue[index],
            onChanged: (v) {
              contoller.switched(v, index);
            }),
        ) ,
        const Expanded(child: SizedBox()),
        IconButton(
            hoverColor: Colors.white.withOpacity(1),
            onPressed: onPressed,
            icon: Icon(
              Icons.cancel_outlined,
              color: appColors.primaryColor,
              size: width * 0.02,
            )),
      ],
    );
  }
}
