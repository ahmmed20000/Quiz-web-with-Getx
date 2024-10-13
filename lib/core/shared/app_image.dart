import 'package:flutter/cupertino.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appImage extends StatelessWidget {
  String path;
  appImage({super.key, required this.path, this.customHeight, this.cutomWidth , required this.hasFit});
  double? cutomWidth;
  double? customHeight;
  bool hasFit;
  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => Image.asset(
      "asesst/images/$path",
      width:cutomWidth?? diviceInfo.screenWidth*0.20,
      height:customHeight?? diviceInfo.screenHeight*0.20,
      fit: hasFit? BoxFit.fill:null,
    ))
    ;
  }
}