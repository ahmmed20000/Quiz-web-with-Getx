import 'package:flutter/material.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';

class DeviceInfo {
  final Orientation orientaion;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth; 
  final double localHeight;

  DeviceInfo({required this.orientaion, required this.deviceType, required this.screenWidth, required this.screenHeight, required this.localWidth, required this.localHeight}); 
}
