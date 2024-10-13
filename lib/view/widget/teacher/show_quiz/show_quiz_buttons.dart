import 'package:flutter/material.dart';
import 'package:quiz/core/shared/app_button.dart';

// ignore: must_be_immutable
class showButtons extends StatelessWidget {
  final double height;
  final double width;
  Function()? onTapAddStudents;
  Function()? onTapShowDetailes;
  String? titleForBlueButton;
  String? titleForyellowButton;
  Icon? blueButtonIcon;
  Icon? yellowButtonIcon;
  Color? customButtonColor;
  showButtons(
      {super.key,
      required this.height,
     required this.width,
      required this.onTapAddStudents,
      required this.onTapShowDetailes, 
      this.blueButtonIcon, 
      this.titleForBlueButton, 
      this.titleForyellowButton, 
      this.yellowButtonIcon, 
      this.customButtonColor
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appButton(
          content:titleForBlueButton?? "Add Students",
          onTap: onTapAddStudents,
          isQuiz: true,
          screenHeight: height * 0.06,
          screenWidth: width * 0.1,
        ),
        SizedBox(
          width: width * 0.01,
        ),
        appButton(
          customButtonColor: customButtonColor,
          content:titleForyellowButton?? "Show Detailes",
          onTap: onTapShowDetailes,
         screenHeight: height * 0.06,
          screenWidth: width * 0.1,
        ),
      ],
    );
  }
}
