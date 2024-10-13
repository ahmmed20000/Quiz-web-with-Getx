// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/core/shared/app_image.dart';
import 'package:quiz/core/shared/app_smallsized.dart';

class RowQuistionTitle extends StatelessWidget {
  int time;
  int mark;
   RowQuistionTitle({
    Key? key,
    required this.time,
    required this.mark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "time".tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Quiz".tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            appSmallSizedBox(),
            Text("$time", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        appImage(
          path: "createQuistion.gif",
          hasFit: false,
        ),
        Column(
          children: [
            Row(
              children: [
                Text("mark".tr, style: Theme.of(context).textTheme.bodySmall),
                Text(
                  "Quiz".tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            appSmallSizedBox(),
            Text("$mark", style: Theme.of(context).textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}
