// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz/core/constant/app_color.dart';

class visibleIcon extends StatelessWidget {
  bool isExpanded;
  bool isogOut;
  IconData? icon;
  bool is_currentpage;
  Function()? onTap;
  visibleIcon(
      {Key? key,
      required this.isogOut ,
      required this.isExpanded,
      required this.icon,
      required this.is_currentpage,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Visibility(
                visible: isExpanded, // تحديد رؤية العنصر

                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 7),
                    decoration: BoxDecoration(
                        color: is_currentpage
                            ? appColors.bgScaffoldColor
                            : appColors.primaryColor,
                        borderRadius: BorderRadius.only(
                           bottomRight:isogOut?  Radius.circular(50):Radius.circular(1),
                            topLeft: Radius.circular(50),
                            
                            bottomLeft: Radius.circular(50))),
                    child: Icon(icon)), // عنصر 2
              ),
            ),
          )
        : Visibility(
            visible: isExpanded, // تحديد رؤية العنصر

            child: Icon(Icons.home), // عنصر 2
          );
  }
}
