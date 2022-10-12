import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:takequiz/controllers/question_papers/question_paper_controller.dart';
import 'package:takequiz/screens/home/question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        (() => ListView.separated(
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
    );
  }
}
