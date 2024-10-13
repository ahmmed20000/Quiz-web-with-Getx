import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "ttt", middleText: "fffffff", actions: [
    ElevatedButton(onPressed: () {}, child: Text("")),
    ElevatedButton(onPressed: () {}, child: Text("")),
  ]);
  return Future.value(true);
}
