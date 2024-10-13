import 'package:flutter/material.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';

DeviceType getDeviceType(MediaQueryData m) {
  Orientation orintation = m.orientation;
  double width = 0;
  if (orintation == Orientation.landscape) {
    width = m.size.height;
  } else {
    width = m.size.width;
  }
  if (width >= 640) {
    print("desktop");
    print(width);
    print(m.size.height);
    return DeviceType.Desktop;
  }
  if (width >= 550) {
    print("taaaab");
    print(width);
    return DeviceType.Tablet;
  }
  print(width);
  print("mobi;eee");

  return DeviceType.Mobile;
}
