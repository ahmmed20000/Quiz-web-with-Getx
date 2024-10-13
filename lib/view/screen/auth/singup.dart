import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz/controller/auth/signup_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/alertexitapp.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_image.dart';
import 'package:quiz/core/shared/app_smallsized.dart';
import 'package:quiz/core/shared/app_textformfiled.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    signUpControllerImp controller = Get.put(signUpControllerImp());
    return Scaffold(
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
                          key: controller.formstate1,
                          child: Container(
                            width: diviceInfo.screenWidth * 0.35,
                            margin: EdgeInsets.symmetric(
                              vertical: diviceInfo.screenHeight * 0.018,
                            ),
                            color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sign".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Text(
                                          "Up".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ],
                                    ),
                                    appImage(
                                      path: "111.jpg", 
                                      hasFit: false, 
                                      customHeight: diviceInfo.localHeight*0.3,
                                      cutomWidth: diviceInfo.localWidth*0.3,
                                      ),
                                    appSmallSizedBox(
                                        //height: diviceInfo.localHeight
                                        ),
                                        appTextFF(
                                      control: controller.name,
                                      valid: (val) {
                                        return validInput(val!, 3, 100, "name" , 10);
                                      },
                                      hint: "Enter Your name",
                                      label: "name",
                                      icon: const Icon(Icons.person),
                                    // height: diviceInfo.localHeight,
                                    // width: diviceInfo.localWidth,
                                    ),
                                    appSmallSizedBox(),
                                    appTextFF(
                                      control: controller.email,
                                      valid: (val) {
                                        return validInput(val!, 5, 100, "email" , 10);
                                      },
                                      hint: "Enter Your Email",
                                      label: "Email",
                                      icon: const Icon(Icons.email_outlined),
                                    // height: diviceInfo.localHeight,
                                    // width: diviceInfo.localWidth,
                                    ),
                                    appSmallSizedBox(),
                                    GetBuilder<signUpControllerImp>(
                                      builder: (controller) => appTextFF(
                                        control: controller.password,
                                        obscure: controller.isShowPassword,
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        valid: (val) {
                                          return validInput(
                                              val!, 4, 30, "password", 10);
                                        },
                                        hint: "Enter Your Password",
                                        label: "Password",
                                        icon: Icon(
                                          Icons.lock_outline,
                                          size: diviceInfo.localWidth * 0.016,
                                        ),
                                      //  width: diviceInfo.localWidth,
                                      // height: diviceInfo.localHeight,
                                      ),
                                    ),
                                    appSmallSizedBox(),
                                    GetBuilder<signUpControllerImp>(
                                      builder: (controller) => appTextFF(
                                        control: controller.confirm,
                                        obscure: controller.isShowPassword,
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                        valid: (val) {
                                          return validInput(
                                              val!, 4, 30, "password", 10);
                                        },
                                        hint: "Enter confirm Password",
                                        label: "Enter confirm Password",
                                        icon: Icon(
                                          Icons.lock_outline,
                                          size: diviceInfo.localWidth * 0.016,
                                        ),
                                      // width: diviceInfo.localWidth,
                                      // height: diviceInfo.localHeight,
                                      ),
                                    ),
                                    appButton(
                                        content: "SignUp",
                                      // screenWidth: diviceInfo.localWidth,
                                      // screenHeight: diviceInfo.localHeight,
                                        onTap: () {
                                          controller.signUp();
                                          
                                        }),
                                  ],
                                ),
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
