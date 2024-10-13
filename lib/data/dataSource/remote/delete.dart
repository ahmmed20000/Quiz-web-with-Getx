import 'package:quiz/core/class/delete.dart';
import 'package:quiz/linkapi.dart';

class deleteT {
  deleteFromApi delate;
  
  deleteT( this.delate);

  deleteData(int deleteId) async {
    var response = await delate.daleteData("${Applink.deleteT}/$deleteId");
    return response.fold((l) => l, (r) => r);
  }
}
