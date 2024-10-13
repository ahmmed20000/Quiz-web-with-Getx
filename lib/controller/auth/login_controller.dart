import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/crud_auth.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/data/dataSource/remote/auth/login.dart';
import 'package:quiz/local2/cache_helper.dart';
import 'package:quiz/view/screen/auth/singup.dart';
import 'package:quiz/view/screen/teacher/create_quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class loginController extends GetxController {
  login();
  goToSignup();
}

class loginControllerImp extends loginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  List data = [];
  //هي مشان اظهار واخفاء كلم المرور
  StatusRequest? statusRequest;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  LoginData loginData = LoginData(CrudAuth());
  late SharedPreferences share;
  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;

      var response = await loginData.postData(email.text, password.text);
      print("========================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // print(response['status']);
        // if(response['status']=="success"){
        //print("sucessssss");
        share = await SharedPreferences.getInstance();
        print("share in login deacleare");
        share.setString("token", response["data"]['token']);
        share.setInt("user_id", response["data"]['user_id']);
        print("sucess in login controller");
        // await CacheHelper.saveData(
        //     key: 'token', value: response["data"]['token']);
        // await CacheHelper.saveData(
        //     key: 'user_id', value: response["data"]['user_id']);
        List responseData= [response["data"]['token'], response['data']['user_id']];
        print("in login controller in if sucess the responseData is ${responseData}");
        //data.addAll(response['data']);
        Get.off(() => createQuiz(), arguments: responseData);
        print("vvvvvvvv");

        // }
        /* else{
        //print("cccc");
        Get.defaultDialog(title:"Warning",middleText: "Email or password not correct");
        statusRequest=StatusRequest.failure;
      }*/
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Email or password not correct");
      }

      update();
    } else {}
  }

  @override
  goToSignup() {
    // TODO: implement goToSignup
    Get.off(signUp());
  }
}
