import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:takequiz/config/themes/app_colors.dart';
import 'package:takequiz/config/themes/app_icons.dart';
import 'package:takequiz/config/themes/custom_Text_style.dart';
import 'package:takequiz/config/themes/ui_parameters.dart';
import 'package:takequiz/controllers/question_papers/question_paper_controller.dart';
import 'package:takequiz/controllers/zoom_drawer_controller.dart';
import 'package:takequiz/screens/home/question_card.dart';
import 'package:takequiz/widgets/app_circle_button.dart';
import 'package:takequiz/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(
      builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          menuScreen: const Text(
            "Hi there",
            style: TextStyle(
              color: Colors.purpleAccent,
            ),
          ),
          mainScreen: Container(
            decoration: BoxDecoration(
              gradient: mainGradient(),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(
                            AppIcons.menuLeft,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                                color: Colors.white,
                              ),
                              Text(
                                " Hello Friend",
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "What do you want to learn today?",
                          style: headerText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          (() => ListView.separated(
                                padding: UIParamaters.mobileScreenPadding,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                    model: _questionPaperController
                                        .allPapers[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount:
                                    _questionPaperController.allPapers.length,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
