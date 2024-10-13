import 'package:get/get.dart';
import 'package:quiz/core/class/curd.dart';



class InitialBindings extends Bindings{
  @override
  void dependencies() {
     
    Get.put(Crud());

  }
  
}