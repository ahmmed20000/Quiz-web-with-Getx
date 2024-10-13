import 'package:quiz/core/class/git.dart';

class getData {
  gitDataCore get;
  getData(this.get);
  GetData(
    String linkData//هون نمرر رابط الغيت
  )async{
var response = await get.getData(linkData);
    return response.fold((l) => l, (r) => r);  }
}
