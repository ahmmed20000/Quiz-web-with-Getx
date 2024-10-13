import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/auth/login_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/alertexitapp.dart';
import 'package:quiz/core/functions/validinput.dart';
import 'package:quiz/core/language/localController.dart';
import 'package:quiz/core/responcive/enums/diviceType.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_smallsized.dart';
import 'package:quiz/core/shared/app_textformfiled.dart';
import 'package:quiz/view/widget/auth/auth_image.dart';
import 'package:quiz/view/widget/auth/create_account_row.dart';

class login extends StatelessWidget {
  const login({super.key});
  
  get builder => null;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    localController c = Get.find();
    loginControllerImp controller = Get.put(loginControllerImp());
    return Scaffold(
      
       bottomNavigationBar: BottomAppBar(),
        backgroundColor: appColors.thirdColor,
        body: WillPopScope(
          onWillPop: alertExitApp,
          child:infoWidget( builder: (context, diviceInfo)=> diviceInfo.deviceType == DeviceType.Desktop ||
                        diviceInfo.deviceType == DeviceType.Tablet
                    ? Center(
                        child: Form(
                          key: controller.formstate,
                          child: Container(
                            width: diviceInfo.screenWidth * 0.35,
                            margin: EdgeInsets.symmetric(
                              vertical: diviceInfo.screenHeight * 0.018,
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Log".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    Text(
                                      "in".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                                authImage(
                                    width: diviceInfo.localWidth,
                                    height: diviceInfo.localHeight,
                                    imageName: "stud1.jpg"),
                                appSmallSizedBox(
                                   // height: diviceInfo.localHeight
                                    ),
                                appTextFF(
                                  control: controller.email,
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "email", 10);
                                  },
                                  hint: "Enter Your Email",
                                  label: "Email",
                                  icon: const Icon(Icons.email_outlined),
                                //  height: diviceInfo.localHeight,
                                 // width: diviceInfo.localWidth,
                                ),
                                appSmallSizedBox(),
                                GetBuilder<loginControllerImp>(
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
                                    //width: diviceInfo.localWidth,
                                   // height: diviceInfo.localHeight,
                                  ),
                                ),
                                appSmallSizedBox(),
                                appButton(
                                    content: "Login",
                                    onTap: () {
                                      controller.login();
                                    }),
                                    appSmallSizedBox(),
                                createAccountRow(
                                  onTap: () {
                                    controller.goToSignup();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Log".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                              Text(
                                "in".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall,
                              ),
                            ],
                          ),
                          authImage(
                              width: diviceInfo.localWidth,
                              height: diviceInfo.localHeight,
                              imageName: "stud1.jpg"),
                          appSmallSizedBox(
                             // height: diviceInfo.localHeight
                              ),
                          appTextFF(
                            control: controller.email,
                            valid: (val) {
                              return validInput(val!, 5, 100, "email", 10);
                            },
                            hint: "Enter Your Email",
                            label: "Email",
                            icon: const Icon(Icons.email_outlined),
                          //  height: diviceInfo.localHeight,
                           // width: diviceInfo.localWidth,
                          ),
                          GetBuilder<loginControllerImp>(
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
                              //width: diviceInfo.localWidth,
                             // height: diviceInfo.localHeight,
                            ),
                          ),
                          appButton(
                              content: "Login",
                             // screenWidth: diviceInfo.localWidth,
                             // screenHeight: diviceInfo.localHeight,
                              onTap: () {
                                controller.login();
                              }),
                              SizedBox(height: 5,),
                          createAccountRow(
                            onTap: () {
                              controller.goToSignup();
                            },
                          )
                        ],
                      ),
                    ),
                      )
        ));
  }
}
