import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingServices extends GetxService {
  late SharedPreferences sharedprefs;
  Future<settingServices> init() async {
    //start services
    sharedprefs = await SharedPreferences.getInstance();
    //end services
    return this;
  }
}
