// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/core/shared/app_image.dart';
import 'package:quiz/core/shared/app_smallsized.dart';

class RowTitle extends StatelessWidget {
  int reminig;
  int? time;
  RowTitle({
    Key? key,
    required this.reminig,
    this.time,
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
            Text("15", style: Theme.of(context).textTheme.bodyMedium)
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
                  "remining".tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            appSmallSizedBox(),
            Text("$reminig", style: Theme.of(context).textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}
