// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_image.dart';

// ignore: must_be_immutable
class authImage extends StatelessWidget {
  double width;
  double height;
  String imageName;
  authImage({
    Key? key,
    required this.width,
    required this.height,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => CircleAvatar(
      backgroundColor: Colors.white,
      maxRadius: diviceInfo.screenWidth * 0.08,
      child: appImage(
        path: imageName,
        hasFit: false,
        customHeight: diviceInfo.screenHeight * 0.5,
        cutomWidth: diviceInfo.screenWidth * 0.5,
      ),
    )
    );
  }
}
