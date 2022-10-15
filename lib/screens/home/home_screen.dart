import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:takequiz/config/themes/ui_parameters.dart';
import 'package:takequiz/controllers/question_papers/question_paper_controller.dart';
import 'package:takequiz/screens/home/question_card.dart';
import 'package:takequiz/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: ContentArea(
        addPadding: false,
        child: Obx(
          (() => ListView.separated(
                padding: UIParamaters.mobileScreenPadding,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionCard(
                    model: _questionPaperController.allPapers[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: _questionPaperController.allPapers.length,
              )),
        ),
      ),
    );
  }
}
