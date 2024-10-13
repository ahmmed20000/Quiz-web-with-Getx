import 'package:get/get.dart';
import 'package:quiz/core/language/localController.dart';

validInput(String val, int min, int max, String type,
    int mark) // انا بهمني بالادخال النوع وصغر واكبر عدد للمحارف والفيمة
// ignore: unused_local_variable
{
  localController c = Get.find();
  if (val.isEmpty&&type!="c") {
    return "can't be Empty".tr;
  }
  
    if (type == "username") {
      if (!GetUtils.isUsername(val)) {
        //اذا لم تكن القيمة ايميل
        return "not vlaid username".tr;
      }
    }
    if (type == "email") {
      if (!GetUtils.isEmail(val)) {
        //اذا لم تكن القيمة ايميل
        return "not valid email".tr;
      }
    }
    if (type == "phone") {
      if (!GetUtils.isEmail(val)) {
        //اذا لم تكن القيمة ايميل
        return "not valid phone".tr;
      }
    }
    if (val.length < min) {
      return "can't be less than".tr + "$min";
    }
    if (val.length > max) {
      return "can't be larger than".tr + "$max";
    }
  }
