import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/teacher/show_quistion_controller.dart';
import 'package:quiz/core/constant/app_color.dart';
import 'package:quiz/core/responcive/uiComponent/infoWidget.dart';
import 'package:quiz/core/shared/app_button.dart';
import 'package:quiz/core/shared/app_sizedbox.dart';
import 'package:quiz/core/shared/app_smallsized.dart';
import 'package:quiz/view/screen/teacher/editequistion.dart';
import 'package:quiz/view/widget/teacher/show_quistion/mark_row.dart';
import 'package:quiz/view/widget/teacher/show_quistion/quistion_list.dart';
import 'package:quiz/view/widget/teacher/show_quiz/show_quiz_buttons.dart';
import 'package:quiz/view/widget/teacher/show_quiz/show_text.dart';

class showQuistion extends StatelessWidget {
  const showQuistion({super.key});

  @override
  Widget build(BuildContext context) {
    showQuistionControllerImp controller = Get.put(showQuistionControllerImp());
    return Scaffold(
      backgroundColor: appColors.thirdColor,
      appBar: AppBar(
        backgroundColor: appColors.bgScaffoldColor,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz mark : ".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            GetBuilder<showQuistionControllerImp>(
                builder: (controller) => Text(
                      " ${controller.markShow}    ",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
            Text(
              "Quiz time : ".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              " ${controller.time}    ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            /* Text(
              "remining markings : ".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Obx(
              () => Text(
                "  ${controller.reminigMark.value}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )*/
          ],
        ),
        actions: [
          appButton(
            content: "Quiz Edit",
            onTap: () {
              controller.editQuiz();
            },
            screenWidth: 100,
          )
        ],
      ),
      body: infoWidget(
        builder: (context, diviceInfo) => controller
                    .realQuiz['questions'].length ==
                0
            ? const Center(
                child: Text("There are no question"),
              )
            : GetBuilder<showQuistionControllerImp>(
                builder: (controller) => GridView.builder(
                    itemCount: controller.editQuestions['questions'].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      // final items = controller.realQuistion['questions']['id'][i];

                      return Container(
                        width: double.infinity,

                        height: diviceInfo.screenHeight * 0.7,

                        //  key: ValueKey(
                        //    items), //استخدمت معرف فريد لكل عنصر مشان عملية الحذف

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(appColors.raduce),
                            border:
                                Border.all(color: appColors.secondaryColor)),

                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              showButtons(
                                  customButtonColor:
                                      Color.fromARGB(255, 252, 93, 82),
                                  titleForBlueButton: "Edit",
                                  titleForyellowButton: "Delete",
                                  height: diviceInfo.screenHeight,
                                  width: diviceInfo.localWidth,
                                  onTapAddStudents: () {
                                    Get.off(() => editQuistion(), arguments: {
                                      //"controller": controller,
                                      "index": i,
                                      "q": controller.editQuestions
                                      // "remining": 66,
                                      // "mark": controller.realQuestion[i]['mark'],
                                      // "text": controller.realQuestion
                                      //     [i]["text"],
                                      // "choices":controller.realQuestion[i]['choices'],
                                    });
                                    print(
                                        "chices in show_quistion is ${controller.realQuestion[i]['choices']}");
                                  },
                                  onTapShowDetailes: () {
                                    controller.deleteQuistion(
                                        controller.editQuestions['questions'][i], i);
                                  }),
                              appMeduimSizedBox(),
                              markRow(
                                  size: diviceInfo.localWidth,
                                  mark: controller.realQuestion[i]['mark']
                                  // controller.getMark(i)
                                  //هون مرق علامة السؤال
                                  ),
                              showText(
                                  size: diviceInfo.localWidth,
                                  content: controller.realQuestion[i]["text"] //هون مرق نص السؤال
                                  ),
                              appSmallSizedBox(),
                              quistionList(
                                width: diviceInfo.localWidth,
                                choices: controller.realQuestion[i]['choices'],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
