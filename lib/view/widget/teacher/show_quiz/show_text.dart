// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class showText extends StatelessWidget {
  double size;
  String content;
  Color? customColor;
  showText({
    Key? key,
    required this.size,
    required this.content,
    this.customColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: size * 0.017,
          color: customColor
        ));
  }
}
