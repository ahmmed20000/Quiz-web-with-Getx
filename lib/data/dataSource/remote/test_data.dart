import'package:quiz/core/class/curd.dart';
import 'package:quiz/linkapi.dart';
class TestData{
  Crud crud;
  TestData(this.crud);

  getData() async
  {
    var response=await crud.postData(Applink.test, {});
    response.fold((l) => l, (r) => r);
   //مارح ارسل بيانات رح استقبل و اعرض 
  }
}