import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz/bindings/initialbinding.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/language/local.dart';
import 'package:quiz/core/language/localController.dart';
import 'package:quiz/core/services/settingServices.dart';
import 'package:quiz/routs.dart';
import 'package:quiz/test_dashboard.dart';
import 'package:quiz/view/cccc.dart';
import 'package:quiz/view/screen/auth/login.dart';
import 'package:quiz/view/screen/auth/singup.dart';
import 'package:quiz/view/screen/teacher/create_quistion.dart';
import 'package:quiz/view/screen/teacher/create_quiz.dart';
import 'package:quiz/view/screen/teacher/editequistion.dart';
import 'package:quiz/view/screen/teacher/show_quistion.dart';
import 'package:quiz/view/screen/teacher/show_quiz.dart';
import 'package:quiz/view/test_excel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices(); // مرقت التابع بالمين مشان اقدر اوصله من كل مكان
   SharedPreferences share = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

Future initServices() async {
  //تابع مشان الخدمات
  await Get.putAsync(() => settingServices().init());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    localController controller = Get.put(localController());
    double m = MediaQuery.of(context).size.width;
    
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language, //هون اخذ اللغة
      theme: ThemeData(
          textTheme: TextTheme(
        //هون ثيم الخطوط الي عندي بكل لتطبيق

        headlineLarge: TextStyle(
            fontSize: m * 0.02,
            fontWeight: FontWeight.bold,
            color: appColors.primaryColor),
        headlineMedium: TextStyle(
            fontSize: m * 0.02,
            fontWeight: FontWeight.bold,
            color: appColors.secondColor),
        headlineSmall: TextStyle(
            fontSize: m * 0.02,
            fontWeight: FontWeight.bold,
            color: appColors.secondaryColor),
        bodyMedium: TextStyle(
            fontSize: m * 0.012,
            fontWeight: FontWeight.w500,
            color: appColors.secondColor),
        bodyLarge: TextStyle(
            fontSize: m * 0.012,
            fontWeight: FontWeight.w500,
            color: appColors.primaryColor),
        bodySmall: TextStyle(
            fontSize: m * 0.012,
            fontWeight: FontWeight.w500,
            color: appColors.secondaryColor),
      )),
      translations: local(),
      home: login(),
      routes: routs,
      initialBinding: InitialBindings(),
    );
  }
}
