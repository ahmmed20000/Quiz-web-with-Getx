import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/delete.dart';
import 'package:quiz/core/class/put.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/alert_dialog.dart';
import 'package:quiz/core/functions/handlingdatacontroller.dart';
import 'package:quiz/data/dataSource/remote/delete.dart';
import 'package:quiz/data/dataSource/remote/teacher/delete_ques.dart';
import 'package:quiz/data/dataSource/remote/teacher/put_question.dart';
import 'package:quiz/view/screen/teacher/show_quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class showQuistionController extends GetxController {
  deleteQuistion(Map<String, dynamic> quis, int index);
  changeRadio(val);
  editQuiz();
  editQuistion(int index);
  editQuistionTest(int index);
}

class showQuistionControllerImp extends showQuistionController {
  GlobalKey<FormState> formstateShowQuistion = GlobalKey<FormState>();

  RxInt reminigMark = 0.obs;
  int change = 0;
  late TextEditingController mark;
  late TextEditingController quistionEditing;
  late TextEditingController A;
  late TextEditingController B;
  late TextEditingController C;
  late TextEditingController D;
  int markShow = 18;
  String time = '0';
  var z = ""; //متحول فيه قيمة الخيار الصحيح
  late Map<String, dynamic> realQuiz = {};
  List<dynamic> realQuestion = [];
  List<int> marksQuestion = []; //متحول اقصر فيه علامات الاسئلةر
  Map<String, dynamic> editQuestions = {};
  List<int> Keys = []; //متحول اقصر فيه المفاتيح
  var choices = [];
  List<dynamic> allData = [];

  StatusRequest? statusRequest;

  late SharedPreferences share;

  putQuestion p = putQuestion(put());

  deleteT deleate = deleteT(deleteFromApi());

  deleteQues deleatQ = deleteQues(deleteFromApi());

  final List<Map<String, dynamic>> quistion = [
    {
      "quize_id": 1,
      "mark": 10.obs,
      "text":
          "What is the capital of Syriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa?",
      "choices": [
        {
          "choice":
              "Almyadennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnmmmmzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
          "is_true": true
        },
        {
          "choice": "Homsvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv",
          "is_true": false
        },
        {
          "choice": "Der Ez Zourzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
          "is_true": false
        },
        {
          "choice": "Aleppoooooooooooooooooooooooooooooooooooo",
          "is_true": false
        }
      ]
    },
    {
      "quize_id": 1,
      "mark": 10.obs,
      "text":
          "What is the capital of Syriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa?",
      "choices": [
        {
          "choice":
              "Almyadennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnmmmmzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
          "is_true": true
        },
        {
          "choice": "Homsvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv",
          "is_true": false
        },
        {
          "choice": "Der Ez Zourzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
          "is_true": false
        },
        {
          "choice": "Aleppoooooooooooooooooooooooooooooooooooo",
          "is_true": false
        }
      ]
    },
    {
      "quize_id": 1,
      "mark": 5.obs,
      "text": "What is the capital of France?",
      "choices": [
        {"choice": "Paris", "is_true": true},
        {"choice": "London", "is_true": false},
        {"choice": "Berlin", "is_true": false}
      ]
    },
    {
      "quize_id": 1,
      "mark": 3.obs,
      "text": "1+1=0 ?",
      "choices": [
        {"choice": "true", "is_true": true},
        {"choice": "false", "is_true": false},
      ]
    }
  ].obs;
  late int quiz_id;

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    mark = TextEditingController();
    quistionEditing = TextEditingController();
    A = TextEditingController();
    B = TextEditingController();
    C = TextEditingController();
    D = TextEditingController();
    realQuiz = Get.arguments;

    int mmm = realQuiz['mark'];
    markShow = mmm;
    update();
    time = realQuiz['duration'];
    realQuestion.addAll(realQuiz['questions']);

    print("real question in show question $realQuestion");
    editQuestions = {
      "id": realQuiz['id'],
      "created_at": realQuiz['created_at'],
      " updated_at": realQuiz['updated_at'],
      "title": realQuiz['title'],
      "duration": time,
      "mark": markShow,
      "date": realQuiz['date'],
      "course_id": realQuiz['course_id'],
      "user_id": realQuiz['user_id'],
      "is_active": realQuiz['is_active'],
      "questions": realQuestion
    };
    // print("question edit before sent is $editQuestions");
    for (int i = 0; i < realQuiz['questions'].length; i++) {
      //marksQuestion [0]= realQuistion['questions'][0]["mark"];
      marksQuestion.add(realQuiz['questions'][i]["mark"]);
      Keys.add(realQuiz['questions'][i]["id"]);
      //print('in loop marks ${Keys[i]}');
      //  for (int j = 0; j < realQuistion['questions'][i]['choices'].length; j++) {
      // print(realQuiz['questions'][i]['choices']);
      choices.addAll(realQuiz['questions'][i]['choices']);
      // }
      // print("choices in question controller isssssssss $choices");
    }

    quistion.shuffle();
    quistion.forEach((quistion) {
      quistion['choices'].shuffle();
    });
  }

  @override
  void changeRadio(val) {
    z = val;
    update();
  }

  @override
  deleteQuistion(Map<String, dynamic> quis, int index) async {
    int r = editQuestions['questions'][index]['mark'];
    //reminigMark.value = reminigMark.value + r;
    markShow = markShow - r;
    editQuestions['mark'] = markShow;
   // print("in delete ques the ques length is ${editQuestions['questions'].length}");
  //  print("in delete quest the id is ${editQuestions["questions"][index]["id"]}");
      //var response =
        //  await deleatQ.deleteData(editQuestions["questions"][index]["id"]);
      //statusRequest = handlingData(response);
      //if (StatusRequest.success == statusRequest) {
       // print("200 sucess in showQuessssssssss Controller in delete ques");
        editQuestions['questions'].remove(quis);
        update();
        //Get.off(() => showQuiz());
      //}
    
    update();
    // print(reminigMark);
    // print("edit question after delete quistion is $editQuestions ");
  }

  @override
  editQuiz() async {
    share = await SharedPreferences.getInstance();
    print(
        "on edit in show question the id is ${editQuestions['id'].toString()}");
    print("in show question  token is ${share.getString("token")}");
    // print(realQuestion);
    List<dynamic> l = realQuestion;
    update();
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${share.getString("token")} ',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(
        'http://127.0.0.1:8000/api/updatequiz/${editQuestions['id'].toString()}');

    var req = http.Request('PUT', url);
    req.headers.addAll(headersList);
    print("the edit questions before send is $editQuestions");
    req.body = json.encode(editQuestions);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
      Get.off(() => showQuiz());
    } else if (res.statusCode == 404) {
      print("error 404 $resBody");
    } else {
      print("error ${res.reasonPhrase}");
    }

    //realQuestion[0]['text'] =editQuestions['questions'][0]['text'] ;
    /* var responeActibvve = await p.putQuess(
        editQuestions['id'].toString(), l, editQuestions['mark']);
    print("respone actcive statues is $responeActibvve");*/
    /* if (reminigMark.value == 0) {
      print("edit quiz sucess");
      Get.to(() => showQuiz());
    } else {
      Get.defaultDialog(
        backgroundColor: appColors.thirdColor,
        title: "",
        textCancel: "Ok".tr,
        content: Column(
          children: [
            Text(
              "you only have $reminigMark mark left",
            ),
          ],
        ),
        buttonColor: appColors.primaryColor,
        confirmTextColor: appColors.secondColor,
        cancelTextColor: appColors.secondColor,
      );
    }*/
  }

  int getMark(int index) {
    print(
        "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbeeeeeeeedoreeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    String mS = realQuiz['questions'][index]["mark"];
    print("pesfire in get mark in show question");
    int m = int.parse(mS);
    print('mark in get maek in show question $m');
    return m;
  }

  @override
  editQuistion(int index) {
    int check = quistion[index]["mark"] + reminigMark.value;
    mark.text = "${quistion[index]["mark"]}";

    quistionEditing.text = quistion[index]["text"];

    A.text = quistion[index]["choices"][0]["choice"];

    B.text = quistion[index]["choices"][1]["choice"];

    if (quistion[index]["choices"].length == 3) {
      C.text = quistion[index]["choices"][2]["choice"];
    }
    if (quistion[index]["choices"].length == 4) {
      C.text = quistion[index]["choices"][3]["choice"];
    }
    Get.defaultDialog(
      backgroundColor: appColors.thirdColor,
      title: "",
      textConfirm: "Ok".tr,
      onCancel: () => print("cancleeee"),
      onConfirm: () {
        if (int.parse(mark.text) <= check) {
          reminigMark.value = reminigMark.value - int.parse(mark.text);

          print('the new quistion editing');
        } else {
          alertDialog("the quistion not added");
        }
      },
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("mark".tr + ":  "),
              /* appTextFF(
                hint: "",
                label: "",
                control: mark,
                icon: Icon(Icons.abc_outlined),
                valid: (val) {
                  return validInput(val!, 1, 100, "mark", 10);
                },
                isJustNumber: true,
                isMark: true,
              )*/
            ],
          ),
          SizedBox(
            height: 20,
          ),
          /* TextFormField(
            controller: mark,
          )*/
          /* appTextFF(
              hint: "write the Quistion".tr,
              label: "Quistion".tr,
              control: quistionEditing,
              icon: Icon(Icons.quiz_sharp),
              valid: (val) {
                return validInput(val!, 1, 100, "mark", 10);
              }),*/

          //RadioChoice(vlaue: "a", control: A),
          // RadioChoice(vlaue: "b", control: B),
          // RadioChoice(vlaue: "c", control: C),
          //RadioChoice(vlaue: "d", control: D),
        ],
      ),
      buttonColor: appColors.primaryColor,
      confirmTextColor: appColors.secondColor,
      cancelTextColor: appColors.secondColor,
    );
  }

  @override
  editQuistionTest(int index) {
    change = quistion[index]["mark"].value + reminigMark.value;
    mark.text = "${quistion[index]["mark"].value}";

    quistionEditing.text = quistion[index]["text"];

    A.text = quistion[index]["choices"][0]["choice"];

    B.text = quistion[index]["choices"][1]["choice"];

    if (quistion[index]["choices"].length == 3) {
      C.text = quistion[index]["choices"][2]["choice"];
    }
    if (quistion[index]["choices"].length == 4) {
      C.text = quistion[index]["choices"][3]["choice"];
    }
    Get.defaultDialog(
      backgroundColor: appColors.thirdColor,
      title: "",
      textConfirm: "Ok".tr,
      onCancel: () {
        if (change == int.parse(mark.text)) {
          change = change - int.parse(mark.text);

          print("change if $change");
        } else {
          change = change - change;
          print("change else $change");
          Get.back();
        }
      },
      onConfirm: () {
        if (int.parse(mark.text) <= change) {
          change = change - int.parse(mark.text);
          reminigMark.value = change;
          quistion[index]["mark"].value = int.parse(mark.text);
          print(quistion[index]["mark"]);
          print('the new quistion editing');
          update();
          Get.back();
        } else {
          print(reminigMark.value);
          alertDialog("the quistion not added");
        }
      },
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("mark".tr + ":  "),
              /* appTextFF(
                hint: "",
                label: "",
                control: mark,
                icon: Icon(Icons.abc_outlined),
                valid: (val) {
                  return validInput(val!, 1, 100, "mark", 10);
                },
                isJustNumber: true,
                isMark: true,
              )*/
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: mark,
          )
          /* appTextFF(
              hint: "write the Quistion".tr,
              label: "Quistion".tr,
              control: quistionEditing,
              icon: Icon(Icons.quiz_sharp),
              valid: (val) {
                return validInput(val!, 1, 100, "mark", 10);
              }),*/
          ,
          //   RadioChoice(vlaue: "a", control: A),
          // RadioChoice(vlaue: "b", control: B),
          // RadioChoice(vlaue: "c", control: C),
          //RadioChoice(vlaue: "d", control: D),
        ],
      ),
      buttonColor: appColors.primaryColor,
      confirmTextColor: appColors.secondColor,
      cancelTextColor: appColors.secondColor,
    );
  }
}
