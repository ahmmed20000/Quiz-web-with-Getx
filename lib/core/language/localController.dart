import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/settingServices.dart';

class localController extends GetxController {
  Locale? language;
  settingServices controller = Get.find();
  changeLang(String codelang) async {
    Locale locale = Locale(codelang);
    controller.sharedprefs.setString(
        "lang", codelang); // خزنت كود اللغة بالذاكرة مشان ينحفظ بشكل دائم
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    String? sharedprefLang = controller.sharedprefs
        .getString("lang"); // جبت القيمة الي اختارها المستخدم
    if (sharedprefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedprefLang == "en") {
      language = const Locale("en");
    } else {
      //في حال ما كان مختار يدخل لغة الجهاز
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
