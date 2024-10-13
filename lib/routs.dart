import 'package:flutter/material.dart';
import 'package:quiz/core/constant/appRouts.dart';
import 'package:quiz/view/screen/auth/login.dart';
import 'package:quiz/view/screen/auth/singup.dart';

Map<String, Widget Function(BuildContext)> routs = {
  AppRoute.login: (context) => login() , 
  AppRoute.signUp: (context) => signUp()
};
