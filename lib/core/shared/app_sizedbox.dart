import 'package:flutter/material.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appMeduimSizedBox extends StatelessWidget {

   appMeduimSizedBox({
    super.key, 
    });

  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => SizedBox(
      height: diviceInfo.screenHeight*0.03,
    )
    )
    ;
  }
}