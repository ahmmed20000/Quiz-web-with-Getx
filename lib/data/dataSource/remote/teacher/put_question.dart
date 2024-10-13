import 'package:quiz/core/class/put.dart';
import 'package:quiz/linkapi.dart';

class putQuestion {
  put putQues;
  putQuestion(this.putQues);
  putQuess(String quiz_id   ,List< dynamic>Question, int quiz_mark, )async{
     var response = await putQues.putData(
    Applink.putQuestion+quiz_id,
    {
    "id": 27,
    "created_at": "2024-08-16T18:55:20.000000Z",
    "updated_at": "2024-08-16T20:22:22.000000Z",
    "title": "اختبار احمد الاول",
    "duration": "30",
    "mark": quiz_mark,
    "date": "2024-08-16",
    "course_id": 1,
    "user_id": 5,
    "is_active": 1,
    "questions": [
      {
        "id": 9,
        "created_at": "2024-08-16T18:56:36.000000Z",
        "updated_at": "2024-08-16T18:56:36.000000Z",
        "mark": 5,
        "text":"",
        "quize_id": 27,
        "choices": [
          {
            "id": 32,
            "created_at": "2024-08-16T18:56:36.000000Z",
            "updated_at": "2024-08-16T18:56:36.000000Z",
            "choice": "اطار عمل تطوير تطبيقات الاندرويد",
            "is_true": 0,
            "question_id": 9
          },
          {
            "id": 33,
            "created_at": "2024-08-16T18:56:36.000000Z",
            "updated_at": "2024-08-16T18:56:36.000000Z",
            "choice": "اطار عمل مبني على لغة دارت",
            "is_true": 0,
            "question_id": 9
          },
          {
            "id": 34,
            "created_at": "2024-08-16T18:56:36.000000Z",
            "updated_at": "2024-08-16T18:56:36.000000Z",
            "choice": "????نستطيع تطوير مواقع ويب منه",
            "is_true": 0,
            "question_id": 9
          },
          {
            "id": 35,
            "created_at": "2024-08-16T18:56:36.000000Z",
            "updated_at": "2024-08-16T18:56:36.000000Z",
            "choice": "كل ما سبق صحيح",
            "is_true": 1,
            "question_id": 9
          }
        ]
      },
      {
        "id": 10,
        "created_at": "2024-08-16T18:57:29.000000Z",
        "updated_at": "2024-08-16T18:57:29.000000Z",
        "mark": 10,
        "text": "كم عدد مواد الدكنور عبدو الي عطانا اياها",
        "quize_id": 27,
        "choices": [
          {
            "id": 36,
            "created_at": "2024-08-16T18:57:29.000000Z",
            "updated_at": "2024-08-16T18:57:29.000000Z",
            "choice": "1",
            "is_true": 0,
            "question_id": 10
          },
          {
            "id": 37,
            "created_at": "2024-08-16T18:57:29.000000Z",
            "updated_at": "2024-08-16T18:57:29.000000Z",
            "choice": "2",
            "is_true": 1,
            "question_id": 10
          },
          {
            "id": 38,
            "created_at": "2024-08-16T18:57:29.000000Z",
            "updated_at": "2024-08-16T18:57:29.000000Z",
            "choice": "3",
            "is_true": 0,
            "question_id": 10
          },
          {
            "id": 39,
            "created_at": "2024-08-16T18:57:29.000000Z",
            "updated_at": "2024-08-16T18:57:29.000000Z",
            "choice": "4",
            "is_true": 0,
            "question_id": 10
          }
        ]
      }
    ]
  },
    
  );
  return response.fold((l) => l, (r) => r);
  }
}