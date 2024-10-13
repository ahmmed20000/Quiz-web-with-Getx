import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/alertexitapp.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class AppDesktopRoute extends StatelessWidget {
  List<Widget> children ;
  Key FormKey ;
   AppDesktopRoute({
    super.key, 
    required this.FormKey , 
    required this.children
    });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: appColors.thirdColor,
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: infoWidget(
            builder: (context,
                    diviceInfo) => //عملت شرط مشان شوف نوع الجهاز وحدد طريقة العرض
                diviceInfo.deviceType == DeviceType.Desktop ||
                        diviceInfo.deviceType == DeviceType.Tablet
                    ? Center(
                        child: Form(
                          key: FormKey,
                          child: Container(
                            width: diviceInfo.screenWidth * 0.35,
                            margin: EdgeInsets.symmetric(
                              vertical: diviceInfo.screenHeight * 0.018,
                            ),
                            color: Colors.white,
                            child: ListView(
                              children: children
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.black,
                        width: double.infinity,
                      ),
          ),
        ));
  }
}