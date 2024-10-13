import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'statusrequest.dart';

class deleteFromApi {
  late SharedPreferences sharedDelete;
  Future<Either<StatusRequest, Map>> daleteData(
    String linkurl,
  ) async {
    sharedDelete = await SharedPreferences.getInstance();
    print("token in DeleteFromApi is ${sharedDelete.getString("token")}");
    try {
      if (/*await checkInternet()*/ true) {
        print("response in beforeeee in delete from api");
        var response = await http.delete(
          Uri.parse(linkurl),
          headers: <String, String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${sharedDelete.getString("token")}',
          },
        );
        print("response in afterrr in delete from api response status is ${response.statusCode}");

        if (response.statusCode == 200 ||
            response.statusCode == 201) //الاتصال بالصفحة تم بنجاح
        {
          Map responsebody = jsonDecode(response.body);
          print("response in body in delete from api is ${responsebody}");
          return Right(responsebody);
        }
        if (response.statusCode == 404) {
          Map responsebody = jsonDecode(response.body);
          print(
              "response in body in in 404 delete from api is ${responsebody}");
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
