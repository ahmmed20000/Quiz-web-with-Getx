import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'statusrequest.dart';

class CrudAuth {
  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map<String, dynamic> data,
  ) async {
    try {
      if (/*await checkInternet()*/ true) {
        var response =
            await http.post(Uri.parse(linkurl),headers: <String , String>{
         'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
         'Accept': 'application/json',
         'Connection': 'keep:alive',
         'Content-Type': 'application/json'}, body: jsonEncode(data));
        print("linkUrl in crud is $linkurl");
        print("response in crud is ${response.statusCode}");
        if (response.statusCode == 200 ||
            response.statusCode == 201) //الاتصال بالصفحة تم بنجاح
        {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure); // استخدمنا ليفت لان الحالات موجودة باليسار
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
