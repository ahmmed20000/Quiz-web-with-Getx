
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<void> convertExcelToJsonAndSendToApiTest() async {
  
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
    allowMultiple: false,
  );

  if (result != null) {
    var jsonList = [];
    var headers = [];
    // print("dddd");
    final file = result.files.first.bytes;
    var excel = Excel.decodeBytes(file!);

    for (var table in excel.tables.keys) {
      //print(table); //sheet Name
      //print(excel.tables[table]?.maxColumns);
      //print(excel.tables[table]?.maxRows);
      if (excel.tables[table]!.rows.isNotEmpty &&
          excel.tables[table]!.rows[0].isNotEmpty) {
        for (var cell in excel.tables[table]!.rows[0]) {
          // إضافة القيمة النصية للخلية في قائمة الheaders
          headers.add(cell?.value);
        }
      }
      // لديك الآن قائمة بأسماء الأعمدة
      print(headers);
      for (var row in excel.tables[table]!.rows.skip(1)) {
        Map<String, dynamic> rowData = {};
        for (int i = 0; i < row.length; i++) {
          // استخدام .value للوصول إلى القيمة الفعلية للخلية
          var cellValue = row[i];
          if (cellValue != null) {
            //print(cellValue.value);
            rowData['${headers[i]}'] = cellValue.value;
          }
        }
        jsonList.add(rowData);
      }
      print(jsonList);
    }

    // Now you can send jsonResult to your API
  } else {
    // Handle case when user cancels file selection
    print('No file selected');
  }
}

class textExcel extends StatelessWidget {
  const textExcel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel to JSON Converter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            convertExcelToJsonAndSendToApiTest();
          },
          child: Text('Convert Excel to JSON and Send to API'),
        ),
      ),
    );
  }
}
