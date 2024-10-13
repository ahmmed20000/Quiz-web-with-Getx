import 'package:flutter/material.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/shared/app_smallsized.dart';

class quistionList extends StatelessWidget {
  final double width;
  final List choices;
  const quistionList({super.key, required this.width, required this.choices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: choices.length,
      physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            width: width * 0.26,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: 
              choices[index]["is_true"] ==1? appColors.primaryColor:Colors.white,
              borderRadius: BorderRadius.circular(appColors.raduce),
              border: Border.all(color: appColors.secondaryColor),
            ),
            child: Text(
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                
                "${choices[index]["choice"]}"
                ),
          ),
          appSmallSizedBox()
        ],
      ),
    );
  }
}
