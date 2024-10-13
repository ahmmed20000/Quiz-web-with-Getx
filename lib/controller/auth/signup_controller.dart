import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/crud_auth.dart';
import 'package:quiz/core/constant/appRouts.dart';
import 'package:quiz/data/dataSource/remote/auth/signup.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class signUpController extends GetxController {
  signUp();
  showPassword();
}

class signUpControllerImp extends signUpController {
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirm;
  bool isShowPassword = true;
  //هي مشان اظهار واخفاء كلم المرور
  StatusRequest? statusRequest; //يعني تقبل ال null
  SignupData signupData = SignupData(CrudAuth());
  List data = [];
  @override
  void onInit() {
    name = TextEditingController();
    // TODO: implement onInit

    email = TextEditingController();
    password = TextEditingController();
    confirm = TextEditingController();
    super.onInit();
  }

  @override
  signUp() async {
    var formdata = formstate1.currentState;
    if (formdata!.validate()) {
      if (password.text == confirm.text) {
        statusRequest = StatusRequest.loading;
        print(name.text);
        var response = await signupData.postData(
            name.text, email.text, password.text, confirm.text);
        print("========================Controller $response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          //if(response['status']=="success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.login);

          /// }else{
          /*  Get.defaultDialog(title:"Warning",middleText: "Phone or Email Already Exists");
        statusRequest=StatusRequest.failure;
      }*/
        }

        update();

        //كل هالحكي مشان يتحقق اذا الحقول صالحة او لا
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "password is not the same".tr);
      }
    } else {}
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
