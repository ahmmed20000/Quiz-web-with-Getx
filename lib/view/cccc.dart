import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class s extends StatelessWidget {
  const s({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: MaterialButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {},
                child: Text("cccccc"),
              ),
              color: Colors.red),
        ),
        body: Column(
          children: [
            Center(
              child: MaterialButton(
                  color: Colors.red,
                  onPressed: ()async {
                    DateTime t =await fetchRealTime();
                    print(t.day);
                  }),
            )
          ],
        ));
  }

  Future<DateTime> fetchRealTime() async {
    var response = await http.get(Uri.parse('https://google.com/5'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var unixTimestamp = jsonResponse['unix_timestamp'];
      return DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    } else {
      throw Exception('Failed to fetch real time');
    }
  }
}
