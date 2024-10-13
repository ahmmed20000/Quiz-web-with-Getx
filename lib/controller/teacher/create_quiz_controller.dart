import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/core/functions/handlingdatacontroller.dart';
import 'package:quiz/data/dataSource/remote/teacher/create_quiz_data.dart';
import 'package:quiz/view/screen/teacher/create_quistion.dart';


abstract class CreateQuizController extends GetxController {
  sendQuiz();
  dropDownChangeSeason(dynamic change);
  dropDownChangeSubject(dynamic change);
  void getDate(DateTime t);
  clearFields();
}

class CreateQuizControllerImp extends CreateQuizController {
  GlobalKey<FormState> formstateCreateQ = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController time;
  late TextEditingController mark;
  DateTime date = DateTime.now();
  late List tokenAndUserid;
  List<String> season = [
    "1",
    "2",
  ];
  List<String> subjects = [
    "java",
    "python",
    "c++",
    "JS",
  ];
  var y;
  var s;
    bool isExpanded = false; // متغير لتحديد ما إذا كان يجب عرض العناصر أم لا

  @override
  void onInit() {
    // TODO: implement onInit
    title = TextEditingController();
    time = TextEditingController();
    mark = TextEditingController();
    tokenAndUserid = Get.arguments as List;
    print("tokenAndUserid in crete quiz contrioller is ${tokenAndUserid[0]}");
    super.onInit();
  }

  StatusRequest? statusRequest;
    changeStateCircle() {
    isExpanded = !isExpanded; // تبديل حالة العرض
    update();
  }
  QuizData quizData = QuizData(Get.find());
  @override
  sendQuiz()async {
    var formdata = formstateCreateQ.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await quizData.postData(title.text, time.text ,int.parse(mark.text),"$date" , 1 , tokenAndUserid[1] , tokenAndUserid[0] );
      print("========================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest)
      Get.to(
        () => createQuestion(),
        arguments: [
          int.parse(time.text), 
          int.parse(mark.text),
          response['data']['id'] , 
          tokenAndUserid, 
          ],
      );
      // id test هي نفسها ال id
      print("الحمد لله");
      clearFields();
      //كل هالحكي مشان يتحقق اذا الحقول صالحة او لا
      print("validate");
    } else {
      print("not validate");
    }
  }

  @override
  dropDownChangeSeason(dynamic change) {
    y = change;
    update();
  }

  @override
  dropDownChangeSubject(change) {
    s = change;
    update();
  }

  @override
  void getDate(DateTime newDate) {
    date = newDate;
    update();
  }

  @override
  clearFields() {
    // من اجل افراغ الحقول بعد كتابة المستخدم
    title.clear();
    mark.clear();
    time.clear();
    update();
  }
}
