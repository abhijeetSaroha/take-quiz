import 'package:get/get.dart';
import 'package:takequiz/controllers/question_papers/question_paper_controller.dart';
import 'package:takequiz/controllers/zoom_drawer_controller.dart';
import 'package:takequiz/screens/home/home_screen.dart';
import 'package:takequiz/screens/introduction/introduction.dart';
import 'package:takequiz/screens/login/login_screen.dart';
import 'package:takequiz/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(
                QuestionPaperController(),
              );
              Get.put(
                MyZoomDrawerController(),
              );
            },
          ),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
      ];
}
