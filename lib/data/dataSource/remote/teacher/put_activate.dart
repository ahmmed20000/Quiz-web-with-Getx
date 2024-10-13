import 'package:quiz/core/class/put.dart';
import 'package:quiz/linkapi.dart';

class putActive {
  put putactivate;
  putActive(this.putactivate);
  putActivate(int quiz_id , int is_active)async{
     var response = await putactivate.putData(
    Applink.putActiv,
    {
     "id":quiz_id , 
     "is_active": is_active
    },
    
  );
  return response.fold((l) => l, (r) => r);
  }
}
