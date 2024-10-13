import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/local2/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'statusrequest.dart';

class Crud {
  late SharedPreferences s;
  Future<Either<StatusRequest, Map>> postData(
      String linkurl,//تمرير رابط ال api
       Map<String, dynamic> data, //تمرير البيانات
       
       ) async {
    s = await SharedPreferences.getInstance();
    try {
      if (/*await checkInternet()*/ true) {
        print(
            "token in share in crudddddddddddddd is  ${s.getString("token")}");
        var response = await http.post( 
          Uri.parse(linkurl),
            headers: <String, String>{
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${s.getString("token")}',
            },
            body: jsonEncode(data));

        if (response.statusCode == 200 ||
            response.statusCode == 201) //الاتصال بالصفحة تم بنجاح
        {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest
              .serverfailure); // استخدمنا ليفت لان الحالات موجودة باليسار
        }
        // ignore: dead_code
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print("=====================crud====================");
      print(_);
      print("========================crud==================");
      return const Left(StatusRequest.serverfailure);
    }
  }
}
