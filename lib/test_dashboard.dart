import 'package:flutter/material.dart';
import 'package:web_dashboard/web_dashboard.dart';

class dashBoard extends StatelessWidget {
  const dashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebDashboard(onTap: (){},
        elements: [
          ButtonElement(index: 0, icon: Icons.home, title: "ccccccccc"), 
          ButtonElement(index: 1, icon: Icons.home, title: "hhhhhhhhhh")
        ], 
        body: Text(
          "homee page"
        ),
         headerContent: HeaderModel(title: "homeeeee")
         ),
    );
  }
}