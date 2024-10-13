import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/show_quistion_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/view/screen/teacher/show_quistion.dart';

class editQuistionController extends GetxController {
  GlobalKey<FormState> formstateEdit = GlobalKey<FormState>();
  var z = ""; //متحول فيه قيمة الخيار الصحيح
  late TextEditingController mark = TextEditingController();
  late TextEditingController quistionEditing = TextEditingController();
  late TextEditingController A = TextEditingController();
  late TextEditingController B = TextEditingController();
  late TextEditingController C = TextEditingController();
  late TextEditingController D = TextEditingController();

  final List<Map<String, dynamic>> quistion = [
    {
      "quize_id": 1,
      "mark": 3,
      "text": "1+1=0 ?",
      "choices": [
        {"choice": "true", "is_true": true},
        {"choice": "false", "is_true": false},
      ]
    }
  ];

  int change = 0;
  int remining = 0;
  late int index;
  late Map<String, dynamic> q;
  late showQuistionControllerImp showController =
      Get.put(showQuistionControllerImp());
  bool aIsTrue = false;
  bool bIsTrue = false;
  bool cIsTrue = false; // متحولات مشان حدد اي اجابة الصحيحة
  bool dIsTrue = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //showController = Get.arguments['controller'];
    index = Get.arguments['index'];
    q = Get.arguments['q'];
    print(index);
    print("the q in edit question is ${q}");
    // remining = Get.arguments['remining'];
    // quistion[0]["mark"] = Get.arguments['mark'];
    //print("type of mark is ${quistion[0]["mark"].runtimeType}");

    //quistion[0]["text"] = Get.arguments['text'];

    // quistion[0]["choices"] = Get.arguments[["choices"][0]];
    mark.text = q["questions"][index]["mark"].toString();
    print("okkk");
    quistionEditing.text = q["questions"][index]["text"];

    A.text = q["questions"][index]["choices"][0]["choice"];

    B.text = q["questions"][index]["choices"][1]["choice"];

    if (q["questions"][index]["choices"].length >= 3) {
      C.text = q["questions"][index]["choices"][2]["choice"];
      print("test cccc");
    }

    if (q["questions"][index]["choices"].length == 4) {
      D.text =q["questions"][index]["choices"][3]["choice"];
      print("test ddddd");
      print(q["questions"][index]["choices"].length);
    }

    print("remining in edite quistion is $remining");
  }

  changeRadio(String v) {
    z = v;
    update();
  }

  editQuistion() {
    // change = quistion[0]["mark"].value + remining;
    String cur = z;
    if (int.parse(mark.text) != q["questions"][index]["mark"]) {
      print(int.parse(mark.text));
      print(q["questions"][index]["mark"]);
      if (int.parse(mark.text) > q["questions"][index]["mark"]) {
        int g = q["questions"][index]["mark"];
        int h = int.parse(mark.text);
        print("before getter in edit ");

        q['mark'] += h - g;
        print("after getter in edit");
        update();
      } else {
        int g = q["questions"][index]["mark"];
        int h = int.parse(mark.text);
        print("after smaller in edit");
        q['mark']-= g - h;
        update();
      }
    }
    //if (int.parse(mark.text) <= change) {
    //  change = change - int.parse(mark.text);
    //  remining = change;
    print('before mark in edite');
    q["questions"][index]["mark"] = int.parse(mark.text);

    print(q["questions"][index]["mark"]);
    print('the new quistion editing');
    update();
    if (cur == "a") {
      aIsTrue = true;
      bIsTrue = false;
      cIsTrue = false;
      dIsTrue = false;
      print("a is Currect $aIsTrue");
    } else if (cur == "b") {
      aIsTrue = false;
      bIsTrue = true;
      cIsTrue = false;
      dIsTrue = false;
      print("b is currect $bIsTrue");
    } else if (cur == "c") {
      if (C.text != "") {
        print("c.text is ${C.text}");
        bIsTrue = false;
        aIsTrue = false;
        cIsTrue = true;
        dIsTrue = false;
        print("c is currect $cIsTrue");
      } else {
        Get.defaultDialog(
          backgroundColor: appColors.thirdColor,
          title: "",
          textCancel: "Ok".tr,
          content: Column(
            children: [
              Text(
                "the field of this choice must be mobilized".tr,
              ),
            ],
          ),
          buttonColor: appColors.primaryColor,
          confirmTextColor: appColors.secondColor,
          cancelTextColor: appColors.secondColor,
        );
      }
    } else if (cur == "d") {
      if (D.text != "" && C.text != "") {
        bIsTrue = false;
        aIsTrue = false;
        cIsTrue = false;
        dIsTrue = true;
        print("d is currect $dIsTrue");
      } else if (D.text != "" && C.text == "") {
        Get.defaultDialog(
          backgroundColor: appColors.thirdColor,
          title: "",
          textCancel: "Ok".tr,
          content: Column(
            children: [
              Text(
                "choice C must be mobilized first".tr,
              ),
            ],
          ),
          buttonColor: appColors.primaryColor,
          confirmTextColor: appColors.secondColor,
          cancelTextColor: appColors.secondColor,
        );
      } else {
        Get.defaultDialog(
          backgroundColor: appColors.thirdColor,
          title: "",
          textCancel: "Ok".tr,
          content: Column(
            children: [
              Text(
                "the field of this choice must be mobilized".tr,
              ),
            ],
          ),
          buttonColor: appColors.primaryColor,
          confirmTextColor: appColors.secondColor,
          cancelTextColor: appColors.secondColor,
        );
      }
    }
    if (aIsTrue == false &&
        bIsTrue == false &&
        cIsTrue == false &&
        dIsTrue == false) {
      Get.defaultDialog(
        backgroundColor: appColors.thirdColor,
        title: "",
        textCancel: "Ok".tr,
        content: Column(
          children: [
            Text(
              "one choice must be chosen".tr,
            ),
          ],
        ),
        buttonColor: appColors.primaryColor,
        confirmTextColor: appColors.secondColor,
        cancelTextColor: appColors.secondColor,
      );
    } else {
      var formdata = formstateEdit.currentState;
      if (formdata!.validate()) {
        print("form is validate");

        print('mark.text is ${int.parse(mark.text)}');
        if (int.parse(mark.text) == q["questions"][index]["mark"]) {
          print("in edit the quistion mark is ${quistion[0]["mark"]}");
          int o = q["questions"][index]["mark"];
          print("in edit the quistion mark is after ${o}");
         // print("in edit the quistion mark is after b  ");
          q["questions"][index]["mark"] = o;
          print(
              "in edit the quistion mark is afterr ${q["questions"][index]["mark"]}");
         // q["mark"] = showController.markShow;
          print(
              "in edit the quistion mark is afterrr ${q["mark"]}");
          update();
        } else {
          q["questions"][index]["mark"]= int.parse(mark.text);
          update(); 
        }
        print('mark editing is ${q["mark"]}');
       q["questions"][index]["text"] =
            quistionEditing.text.toString();
        update();
        print("afterrrrrrrrrrrrrr");
        if (C.text == "" && D.text != "") {
          Get.defaultDialog(
            backgroundColor: appColors.thirdColor,
            title: "",
            textCancel: "Ok".tr,
            content: Column(
              children: [
                Text(
                  "choice C must be mobilized first".tr,
                ),
              ],
            ),
            buttonColor: appColors.primaryColor,
            confirmTextColor: appColors.secondColor,
            cancelTextColor: appColors.secondColor,
          );
        } else if (C.text != "") {
          if (D.text != "") {
            print("before full");
            // print("type of choice is ${showController.realQuestion[index]["choices"]
            //         ["updated_at"]}");
            // print("type of is_true is ${showController.realQuestion[index]["choices"]
            //         ['is_true'].runtimeType}");
            q["questions"][index]["choices"] = [
              {
                "id": q["questions"][index]["choices"][0]["id"],
              "created_at": q["questions"][index]["choices"][0]["created_at"],
              "updated_at": q["questions"][index]["choices"][0]["updated_at"],
                "choice": A.text.toString(),
                "is_true": aIsTrue ? 1 : 0,
                "question_id": q["questions"][index]["choices"][0]["question_id"]
              },
              {
                 "id": q["questions"][index]["choices"][1]["id"],
              "created_at": q["questions"][index]["choices"][1]["created_at"],
              "updated_at": q["questions"][index]["choices"][1]
                  ["updated_at"],
                "choice": B.text.toString(),
                "is_true": bIsTrue ? 1 : 0,
                "question_id": q["questions"][index]["choices"][1]
                  ["question_id"]
              },
              {
                 "id": q["questions"][index]["choices"][2]["id"],
              "created_at": q["questions"][index]["choices"][2]
                  ["created_at"],
              "updated_at": q["questions"][index]["choices"][2]
                  ["updated_at"],
                "choice": C.text.toString(),
                "is_true": cIsTrue ? 1 : 0,
                 "question_id":q["questions"][index]["choices"][2]
                  ["question_id"]
              },
              {
                "id": q["questions"][index]["choices"][3]["id"],
              "created_at": q["questions"][index]["choices"][3]
                  ["created_at"],
              "updated_at":q["questions"][index]["choices"][3]
                  ["updated_at"],
                "choice": D.text.toString(),
                "is_true": dIsTrue ? 1 : 0,
                 "question_id": q["questions"][index]["choices"][3]
                  ["question_id"]
              },
            ];
            print("full choice");
            update();
            // showController.reminigMark.value = remining;
            // update();
            print("the new quitions is ${q}");
             Get.off(() => showQuistion() , arguments:q);
          } else {
            q["questions"][index]["choices"] = [
              {"choice": A.text.toString(), "is_true": aIsTrue == true ? 1 : 0},
              {
                "choice": B.text.toString(),
                "is_true": bIsTrue == true ? 1 : 0,
              },
              {
                "choice": C.text.toString(),
                "is_true": cIsTrue == true ? 1 : 0,
              },
            ];
            print("full choice-1");
            //  showController.reminigMark.value = remining;
            // update();
            // print("the new quition is ${showController.quistion[index]}");
            Get.to(() => showQuistion());
          }
        } else {
          q["questions"][index]["choices"] = [
            {"choice": A.text.toString(), "is_true": aIsTrue == true ? 1 : 0},
            {"choice": B.text.toString(), "is_true": bIsTrue == true ? 1 : 0},
          ];
          //showController.reminigMark.value = remining;
          //update();
          //print("the new quition is ${showController.quistion[index]}");
          print("full choice-2");

          Get.to(() => showQuistion());
        }
      }
    }
    //  print(cur);
    //  print(showController.quistion[index]["mark"]);
    // } else {
    //   Get.defaultDialog();
    //   print(remining);
    //   print("failed");
    // }
  }
}
