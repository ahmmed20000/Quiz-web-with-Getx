import 'package:quiz/core/class/curd.dart';
import 'package:quiz/linkapi.dart';
class QuistionData {
  Crud crud;
  QuistionData(this.crud);
  postData(
    int quiz_id ,
    int mark,
    String title,
    String ChoiceA,
    String ChoiceB,
    String ChoiceC,
    String ChoiceD,
    bool CurrectA,
    bool CurrectB,
    bool CurrectC,
    bool CurrectD,
    List<dynamic> choc,
    String token
  ) async {
    var response = await crud.postData(Applink.quistion, {
      "quize_id": quiz_id,
      "mark": mark,
      "text": title,
      "choices":choc
      /* [
        {"choice": ChoiceA, "is_true": CurrectA},
        {"choice": ChoiceB, "is_true": CurrectB},
        {"choice": ChoiceC, "is_true": CurrectC},
        {"choice": ChoiceD, "is_true": CurrectD},
      ]*/
    });
    return response.fold((l) => l, (r) => r);
  }
}
