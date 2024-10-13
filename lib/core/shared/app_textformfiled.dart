// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appTextFF extends StatelessWidget {
  final String hint;
  bool? noValidate = false ;
  final String label;
  TextEditingController control;
  Icon icon;
  final String? Function(String?)? valid;
  bool? obscure;
  void Function()? onTapIcon;
  bool? isJustNumber = false;
  bool? isMark = false;
  bool? isChoice = false;
  appTextFF(
      {Key? key,
      this.noValidate ,
      required this.hint,
      required this.label,
      required this.control,
      required this.icon,
      required this.valid,
      this.obscure,
      this.onTapIcon,
      this.isMark,
      this.isChoice,
      this.isJustNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp numberOnly = RegExp(r'\d+'); //مت
    return infoWidget(
        builder: (context, diviceInfo) => Container(
              padding: isMark == true
                  ? null
                  : EdgeInsets.symmetric(
                      horizontal: diviceInfo.screenWidth * 0.03),
              margin: isMark == true
                  ? null
                  : EdgeInsets.only(bottom: diviceInfo.screenHeight * 0.03),
              //height: height * 0.08,
              width: isMark == true ? 80 : null,
              child: TextFormField(
                validator:noValidate==true? null : valid, // هي مشان القيود
                controller: control,

                keyboardType: isJustNumber == true
                    ? TextInputType.number
                    : TextInputType.text,

                inputFormatters: isJustNumber == true
                    ? [FilteringTextInputFormatter.allow(numberOnly)]
                    : null,
                obscureText: obscure == null || obscure == false ? false : true,

                decoration: InputDecoration(
                  suffixIconColor: appColors.primaryColor,
                  prefixIconColor: appColors.primaryColor,
                  hoverColor: appColors.primaryColor,
                  label: isMark == true || isChoice == true
                      ? null
                      : Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: diviceInfo.screenWidth * 0.006),
                          child: Text(
                            label.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: isMark == true ? null : hint.tr,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: diviceInfo.screenWidth * 0.017),
                  suffixIcon: isMark == true || isChoice== true
                      ? null
                      : GestureDetector(
                          onTap: onTapIcon,
                          child: icon,
                        ),
                  hintStyle:
                      TextStyle(fontSize: diviceInfo.screenWidth * 0.009),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(appColors.raduce),
                  ),
                ),
              ),
            ));
  }
}
