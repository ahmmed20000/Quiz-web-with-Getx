import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/delete.dart';
import 'package:quiz/core/class/git.dart';
import 'package:quiz/core/class/put.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/core/functions/alert_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/core/functions/handlingdatacontroller.dart';
import 'package:quiz/data/dataSource/remote/delete.dart';
import 'package:quiz/data/dataSource/remote/get_data.dart';
import 'package:quiz/data/dataSource/remote/teacher/put_activate.dart';
import 'package:quiz/linkapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class showQuizController extends GetxController {
  deleteQuiz(int i, int item);
  checkCancle(int index, int item);
}

class showQuizControllerImp extends showQuizController {
  GlobalKey<FormState> formstateShowQuiz = GlobalKey<FormState>();

  late SharedPreferences share;

  late RxList<String> items = List.generate(
      100, //هون حط عدد الاختبارات الي عندي
      (index) => "$index").obs;
  bool isExpanded = false; // متغير لتحديد ما إذا كان يجب عرض العناصر أم لا
  late List<bool> excelResult = List.generate(100, (index) => false);

  late List<bool> switchValue;
  List<bool> currentPage = [false, true];

  int SwitchValueToApi = 0;

  late int User_id;

  StatusRequest? statusRequest;

  deleteT deleate = deleteT(deleteFromApi());

  getData dataSource = getData(gitDataCore());

  putActive pu = putActive(put());

  var responseData = [];
  changeStateCircle() {
    isExpanded = !isExpanded; // تبديل حالة العرض
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit

    share = await SharedPreferences.getInstance();

    User_id = share.getInt("user_id")!;
    statusRequest = StatusRequest.loading;
    var response = await dataSource.GetData("${Applink.getQuizes}/$User_id");
    // print("in show quiz controller the response is ${response["quizzes"]}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("in show quiz controller Statues is sucess");

      responseData.addAll(response["quizzes"]);
      switchValue = List.filled(responseData.length, false);
      for (int i = 0; i < responseData.length; i++) {
        if (responseData[i]["is_active"] == 1) {
          switchValue[i] = true;
        }
      }
      update();
      print(responseData[0]);
    }
    super.onInit();
  }

  @override
  deleteQuiz(int i, int item) {
    print(responseData[i]["id"]);
    //.removeWhere((element) => element[i]["id"]);
    Map<String, dynamic>? elements = responseData
        .firstWhere((element) => element['id'] == item, orElse: () => null);
    print(elements);
    responseData.removeWhere(
      (element) => element == elements,
    );
    update();
    print("respone data length is ${responseData.length}");
  }

  switched(v, index) async {
    switchValue[index] = v;
    update();
    SwitchValueToApi = v ? 1 : 0;

    print("in show quiz in switche the id is ${responseData[index]["id"]}");
    var responeActibvve =
        await pu.putActivate(responseData[index]["id"], SwitchValueToApi);
    print("respone actcive statues is $responeActibvve");

    update();
  }

  Map<String, dynamic> showDetailes(int index) {
    Map<String, dynamic> question = responseData[index];
    print(question);
    return question;
  }

  @override
  checkCancle(int index, int item) async {
    if (excelResult[index]) {
      alertDialog(
          "Student list have been added ,\n so you can't cancle the Quiz");
    } else {
      // String url = "http://127.0.0.1:8000/api/deletequiz/10";
      var response = await deleate.deleteData(responseData[index]["id"]);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("200 sucess in showQuiz Controller in delete");
        deleteQuiz(index, item);
        update();
      }
      print("the file isnooooot add then the cancle will play");
    }
  }
}
