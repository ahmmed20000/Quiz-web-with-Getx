// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:quiz/controller/teacher/create_quiz_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class drobDownTeacher extends StatelessWidget {
  List<String> itemsSource;
  var value;
  bool isSeason;
  String defaultContent;
  String title;
  double? width;

  drobDownTeacher({
    Key? key,
    this.width ,
    required this.itemsSource,
    required this.value,
    required this.isSeason,
    required this.defaultContent,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => Container(
           // width:width! ,
            child: Column(
              children: [
                Text(
                  title.tr,
                  style: isSeason
                      ? Theme.of(context).textTheme.bodySmall
                      : Theme.of(context).textTheme.bodyLarge,
                ),
                GetBuilder<CreateQuizControllerImp>(
                  builder: (controller) => DropdownButton(
                      style: Theme.of(context).textTheme.bodyMedium,
                      borderRadius: BorderRadius.circular(appColors.raduce),
                      items: itemsSource
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  e,
                                  style: const TextStyle(),
                                ),
                              )))
                          .toList(),
                      value: value,
                      hint: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          defaultContent,
                        ),
                      ),
                      onTap: () {
                        print(controller.y);
                      },
                      onChanged: (dynamic T) {
                        isSeason
                            ? controller.dropDownChangeSeason(T)
                            : controller.dropDownChangeSubject(T);
                      }),
                ),
              ],
            )));
  }
}
