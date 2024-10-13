import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quiz/core/class/curd.dart';
import 'package:quiz/core/class/statusrequest.dart';
import 'package:quiz/core/functions/handlingdatacontroller.dart';
import 'package:quiz/data/dataSource/remote/teacher/addexc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> convertExcelToJsonAndSendToApi(int quiz_id) async {
  print("in send excel quiz id is $quiz_id");
  StatusRequest? statusRequest;
  addExcel send = addExcel(Crud());
  late SharedPreferences share;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
    allowMultiple: false,
  );
  bool resultprocess = false;

  if (result != null) {
    List<String> jsonList = [];
    // var headers = [];
    // print("dddd");
    final file = result.files.first.bytes;
    var excel = Excel.decodeBytes(file!);

    for (var table in excel.tables.keys) {
      //print(table); //sheet Name
      //print(excel.tables[table]?.maxColumns);
      //print(excel.tables[table]?.maxRows);
      /* if (excel.tables[table]!.rows.isNotEmpty &&
          excel.tables[table]!.rows[0].isNotEmpty) {
        for (var cell in excel.tables[table]!.rows[0]) {
          // إضافة القيمة النصية للخلية في قائمة الheaders
          headers.add(cell?.value);
        }
      }
      // لديك الآن قائمة بأسماء الأعمدة
      print(headers);*/
      for (var row in excel.tables[table]!.rows.skip(1)) {
        List<String> rowData = [];
        for (int i = 0; i < row.length; i++) {
          // استخدام .value للوصول إلى القيمة الفعلية للخلية
          var cellValue = row[i];
          if (cellValue != null) {
            //print(cellValue.value);
            jsonList.add(cellValue.value.toString());
          }
        }
        //jsonList.add(rowData);
      }
      print(jsonList);
      resultprocess = true;
    }
    statusRequest = StatusRequest.loading;
    var respone = await send.postData(jsonList, quiz_id);
    print("in send Excel the respone is $respone");
    statusRequest = handlingData(respone);
    if (StatusRequest.success == statusRequest) {
      print("the file send");
    }
    // Now you can send jsonResult to your API
  } else {
    // Handle case when user cancels file selection
    print('No file selected');
    resultprocess = false;
  }
  return resultprocess;
}
