import 'package:quiz/core/class/crud_auth.dart';
import 'package:quiz/linkapi.dart';

class SignupData{
  CrudAuth crud;
  SignupData(this.crud);
  postData(String name,String email,String password,String c_password) async{
    var response=await crud.postData(Applink.signUp,  {
      "name":name,
      "email":email,
      "password":password,
      "c_password":c_password
    });
    return response.fold((l)=>l,(r)=>r);
  }
}