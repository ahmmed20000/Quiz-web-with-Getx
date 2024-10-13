import 'package:quiz/core/class/delete.dart';
import 'package:quiz/linkapi.dart';

class deleteQues {
  deleteFromApi delate;
  
  deleteQues( this.delate);

  deleteData(int deleteId) async {
    var response = await delate.daleteData("${Applink.deleteQues}/$deleteId");
    return response.fold((l) => l, (r) => r);
  }
}
