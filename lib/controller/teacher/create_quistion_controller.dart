import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/functions/handlingdatacontroller.dart';
import 'package:quiz/core/shared/app_image.dart';
import 'package:quiz/data/dataSource/remote/teacher/create_quistion_data.dart';
import 'package:quiz/view/screen/teacher/create_quiz.dart';

abstract class CreateQuistion extends GetxController {
  sendQuistion();
  clearFields();
  changeRadio(val);
  sendQuiz();
}

class CreateQuistionImp extends CreateQuistion {
  GlobalKey<FormState> formstateCreateQuition = GlobalKey<FormState>();

  int mark = 1;
  int time = 0;
  var z = ""; //متحول فيه قيمة الخيار الصحيح
  int test_id = 1; // هون ايدي الاختبار رح اخدو من الساشة القبل
  int check = 0; //منحول تراكمي حط فيه مجموع علامات الاسئلة
  TextEditingController m = TextEditingController();
  TextEditingController qus = TextEditingController();
  TextEditingController A =
      TextEditingController(); //متحولات من اجل محتوى الحقول
  TextEditingController B = TextEditingController();
  TextEditingController C = TextEditingController();
  TextEditingController D = TextEditingController();
  bool aIsTrue = false;
  bool bIsTrue = false;
  bool cIsTrue = false; // متحولات مشان حدد اي اجابة الصحيحة
  bool dIsTrue = false;
  late List tokenAndUserid;

  @override
  void clearFields() {
    // من اجل افراغ الحقول بعد كتابة المستخدم
    m.clear();
    qus.clear();
    A.clear();
    B.clear();
    C.clear();
    D.clear();
  }

  final RegExp numberOnly =
      RegExp(r'\d+'); //متحول من اجل ان اجبر امستخدم على ادخال اعداد موجبة فقط
  @override
  void onInit() async {
    mark = Get.arguments[1];
    time = Get.arguments[0];
    test_id = await Get.arguments[2];
    tokenAndUserid = Get.arguments[3];
    // TODO: implement onInit
    super.onInit();
    print("token in create quistion :$tokenAndUserid");
  }

  StatusRequest? statusRequest;
  QuistionData quizData = QuistionData(Get.find());
  @override
  void changeRadio(val) {
    z = val;
    update();
  }

  @override
  void sendQuistion() async {
    int mdb = 0; // متحول اضع فيه قيمة علامة كل سؤال قيمته 0 اذا لم يضع علامة
    //String? q = qus.text;
    //String? a = A.text;
    //String? b = B.text;
    //String? c = C.text;
    //String? d = D.text;

    String cur = z;
    int result = 0;

    var formdata = formstateCreateQuition.currentState;
    if (formdata!.validate()) {
      //كل هالحكي مشان يتحقق اذا الحقول صالحة او لا
      // اذا كان حقل العلامة مانو فارغ اعمل عملية الاسناد لان اذا فارغ وعملت عملية اسناد رح يعطي خطأ منطقي بسبب اسناد سلسلة لمتحول صحيح
      mdb = int.parse(m.text);

      if (check <= mark) {
        //شيك باول مرة قيمته صفر لان هو متحول تراكمي
        // عندي متحول تراكمي عرفته بالبداية مشان لما المستخدم يتجاوز علامة الاختبار اوقفه
        check += mdb;
        print("first if");
      }
      if (/*mdb != 0*/ mdb >= 0 &&
              cur != "" &&
              check <=
                  mark //هذا الشرط مشان قيمة الادخال ما تتجاوز العلامة والشيك تراكمية
          ) {
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
          // ignore: unnecessary_null_comparison

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
        List choc;
        print("choec d is ${D.text}");
        print("choec c is ${C.text}");
        if (C.text == "" && D.text == "") {
          choc = [
            {"choice": A.text, "is_true": aIsTrue},
            {"choice": B.text, "is_true": bIsTrue},
          ];
          statusRequest = StatusRequest.loading;
          var response = await quizData.postData(
            test_id,
            int.parse(m.text),
            qus.text,
            A.text,
            B.text,
            C.text,
            D.text,
            aIsTrue,
            bIsTrue,
            cIsTrue,
            dIsTrue,
            choc,
            tokenAndUserid[0],
          );
          print("========================Controller $response");
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            Get.defaultDialog(
              backgroundColor: appColors.thirdColor,
              title: "",
              textCancel: "Ok".tr,
              content: Column(
                children: [
                  Text(
                    "Question added".tr,
                  ),
                ],
              ),
              buttonColor: appColors.primaryColor,
              confirmTextColor: appColors.secondColor,
              cancelTextColor: appColors.secondColor,
            );
          }
        } else if (D.text == "") {
          choc = [
            {"choice": A.text, "is_true": aIsTrue},
            {"choice": B.text, "is_true": bIsTrue},
            {"choice": C.text, "is_true": cIsTrue},
          ];
          statusRequest = StatusRequest.loading;
          var response = await quizData.postData(
            test_id,
            int.parse(m.text),
            qus.text,
            A.text,
            B.text,
            C.text,
            D.text,
            aIsTrue,
            bIsTrue,
            cIsTrue,
            dIsTrue,
            choc,
            tokenAndUserid[0],
          );
          print("========================Controller $response");
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            Get.defaultDialog(
              backgroundColor: appColors.thirdColor,
              title: "",
              textCancel: "Ok".tr,
              content: Column(
                children: [
                  Text(
                    "Question added".tr,
                  ),
                ],
              ),
              buttonColor: appColors.primaryColor,
              confirmTextColor: appColors.secondColor,
              cancelTextColor: appColors.secondColor,
            );
          }
        } else if (D.text != "" && C.text == "") {
          check -= mdb;
          Get.defaultDialog(
            backgroundColor: appColors.thirdColor,
            title: "",
            textCancel: "Ok".tr,
            content: Column(
              children: [
                Text(
                  "يجب تعبئة الحقل السابق",
                ),
              ],
            ),
            buttonColor: appColors.primaryColor,
            confirmTextColor: appColors.secondColor,
            cancelTextColor: appColors.secondColor,
          );
        } else {
          choc = [
            {"choice": A.text, "is_true": aIsTrue},
            {"choice": B.text, "is_true": bIsTrue},
            {"choice": C.text, "is_true": cIsTrue},
            {"choice": D.text, "is_true": dIsTrue},
          ];
          statusRequest = StatusRequest.loading;
          var response = await quizData.postData(
            test_id,
            int.parse(m.text),
            qus.text,
            A.text,
            B.text,
            C.text,
            D.text,
            aIsTrue,
            bIsTrue,
            cIsTrue,
            dIsTrue,
            choc,
            tokenAndUserid[0],
          );
          print("========================Controller $response");
          statusRequest = handlingData(response);
          if (StatusRequest.success == statusRequest) {
            Get.defaultDialog(
              backgroundColor: appColors.thirdColor,
              title: "",
              textCancel: "Ok".tr,
              content: Column(
                children: [
                  Text(
                    "Question added".tr,
                  ),
                ],
              ),
              buttonColor: appColors.primaryColor,
              confirmTextColor: appColors.secondColor,
              cancelTextColor: appColors.secondColor,
            );
          }
        }
        //هون اعمل ارسال لقاعدة البيانات
        /*  statusRequest = StatusRequest.loading;
        var response = await quizData.postData(
            test_id,
            int.parse(m.text),
            qus.text,
            A.text,
            B.text,
            C.text,
            D.text,
            aIsTrue,
            bIsTrue,
            cIsTrue,
            dIsTrue,
            tokenAndUserid[0]);
        print("========================Controller $response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          Get.defaultDialog(
            backgroundColor: appColors.thirdColor,
            title: "",
            textCancel: "Ok".tr,
            content: Column(
              children: [
                Text(
                  "Question added".tr,
                ),
              ],
            ),
            buttonColor: appColors.primaryColor,
            confirmTextColor: appColors.secondColor,
            cancelTextColor: appColors.secondColor,
          );
        }*/
        clearFields();
      }
      if (check > mark) {
        //هاد الشرط مشان اذا المستخدم تجاوز حجم العلامة المطلوبة او ادخل حجم علامة اكبر من المارك
        result = mark -
            (check -
                mdb); //لما يدخل عهل شرط رح تكون قيمة الشيك تجاوزت قيمة المارك لهيك لازم رجع الشيك لقيمتها القديمة قبل ما يدخل المستخدم لهيك طرحت منها القيمة الي دخلها المستخدم اخر شي
        print("تجاوز حجم العلامة");
        print(check);
        print(mark);
        Get.defaultDialog(
          backgroundColor: appColors.thirdColor,
          title: "",
          textCancel: "Ok".tr,
          content: Column(
            children: [
              Text(
                "${"you only have".tr}$result${"mark left".tr}",
              ),
            ],
          ),
          buttonColor: appColors.primaryColor,
          confirmTextColor: appColors.secondColor,
          cancelTextColor: appColors.secondColor,
        );
        check -= mdb; //شلت من الشيك القمة الي دخلها المستخدمz
      }
      print("validate");
    } else {
      check -= mdb;
      print("not validate");
    }
  }

  @override
  void sendQuiz() async {
    if (check < mark) {
      Get.defaultDialog(
        backgroundColor: appColors.thirdColor,
        title: "",
        textCancel: "Ok".tr,
        content: Column(
          children: [
            Text(
              "${"you only have".tr}${mark - check}${"mark left".tr}",
            ),
          ],
        ),
        buttonColor: appColors.primaryColor,
        confirmTextColor: appColors.secondColor,
        cancelTextColor: appColors.secondColor,
      );
    } else {
      print("وصل للكويز ايدي");
      Get.defaultDialog(
        onCancel: () {
          Get.offAll(createQuiz(), arguments: tokenAndUserid);
        },
        backgroundColor: appColors.thirdColor,
        title: "",
        textCancel: "Ok".tr,
        content: Column(
          children: [
            Text(
              "${"quiz ID is :".tr}$test_id",
            ),
          ],
        ),
        buttonColor: appColors.primaryColor,
        confirmTextColor: appColors.secondColor,
        cancelTextColor: appColors.secondColor,
      );
    }
  }
}
