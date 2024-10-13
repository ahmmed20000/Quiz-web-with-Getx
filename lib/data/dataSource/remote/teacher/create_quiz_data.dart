

import 'package:quiz/core/class/curd.dart';
import 'package:quiz/linkapi.dart';


class QuizData{
  Crud crud;
  QuizData(this.crud);
  
      
            
    
postData(String title, String  time, int mark, String date, int n, int m, String token) async {

  var response = await crud.postData(
    Applink.quiz,
    {
      "title": title,
      "mark": mark,
      "duration": time,
      "date": date,
      "course_id": 1,
      "user_id": m
    },
    
  );
  return response.fold((l) => l, (r) => r);
}

}