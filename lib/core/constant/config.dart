//set constant config here
import 'package:flutter/material.dart';

class Config {
  static late MediaQueryData mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  static void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }
  static get widthSize{
    return screenWidth;
  }
  static get heightSize{
    return screenHeight;
  }
  //define spacing height
  static final spaceSmaller=SizedBox(height:screenHeight!*0.013);
  static final spaceSmall=SizedBox(height:screenHeight!*0.025);
  static final spaceMedium=SizedBox(height: screenHeight!*0.05);
  static final spaceBig=SizedBox(height: screenHeight!*0.08);
  //text-form filed border
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Color(0xFF3CB9EA)
    )
  );
  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
          color:Colors.red
      )
  );
  static Padding  appPadding = Padding(
    padding: EdgeInsets.symmetric(horizontal: 50 , 
    vertical: 100)
    );
}