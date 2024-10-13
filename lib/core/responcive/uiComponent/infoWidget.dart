import 'package:flutter/material.dart';
import 'package:quiz/core/responcive/function/getDeviceType.dart';
import 'package:quiz/core/responcive/models/diviceInfo.dart';

class infoWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo diviceInfo) builder;

  const infoWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var m = MediaQuery.of(context);
      var deviceInfo = DeviceInfo(
          orientaion: m.orientation,
          deviceType: getDeviceType(m),
          screenWidth: m.size.width,
          screenHeight: m.size.height,
          localWidth: constrains.maxWidth,
          localHeight: constrains.maxHeight);
      return builder(context, deviceInfo);
    });
  }
}
