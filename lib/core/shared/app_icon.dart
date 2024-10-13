// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class appIcon extends StatelessWidget {
  double width;
  IconData icon ;
  appIcon({
    Key? key,
    required this.width,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: width * 0.016,
    );
  }
}
