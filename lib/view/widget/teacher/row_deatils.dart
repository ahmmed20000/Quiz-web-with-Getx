// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/create_quiz_controller.dart';
import 'package:quiz/view/widget/teacher/drop_down_teacher.dart';

// ignore: must_be_immutable
class RowTeacherDetails extends StatelessWidget {
  double width;
  RowTeacherDetails({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateQuizControllerImp controller = Get.find();
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            drobDownTeacher(
              itemsSource: controller.subjects,
              value: controller.s,
              isSeason: false,
              defaultContent: controller.subjects[0],
              title: "Subject",
              //width:width*0.3,
            ),
            SizedBox(
              width: width * 0.05,
            ),
            drobDownTeacher(
                // width: width*0.3,
                itemsSource: controller.season,
                value: controller.y,
                isSeason: true,
                defaultContent: "1",
                title: "Season"),
            SizedBox(
              width: width * 0.05,
            ),
            Container(
              //width: width*0.4,
              child: Column(
                children: [
                  Text("Quiz Date".tr,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    child: Text(
                        "${controller.date.year}/${controller.date.month}/${controller.date.day}"),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: controller.date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2200));
                      if (newDate == null) return;
                      controller.getDate(newDate);
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
