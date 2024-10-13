import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'statusrequest.dart';

class put {
  late SharedPreferences s;
  Future<Either<StatusRequest, Map>> putData(
      String linkurl, Map<String, dynamic> data) async {
    s = await SharedPreferences.getInstance();
    try {
      if (true) {
        print("in put method token is ${s.getString("token")}");
        var response = await http.put(Uri.parse(linkurl),
            headers: <String, String>{
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${s.getString("token")}',
            },
            body: jsonEncode(data));
        print("in put method statues code is ${response.statusCode}");
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
