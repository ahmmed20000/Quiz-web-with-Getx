import 'package:quiz/core/class/crud_auth.dart';
import 'package:quiz/linkapi.dart';

class LoginData{
  CrudAuth crud;
  LoginData(this.crud);
  postData(String email,String password) async{
    var response=await crud.postData(Applink.login,{
      
      "email":email,
      "password":password
    });
    return response.fold((l)=>l,(r)=>r);
  }
}