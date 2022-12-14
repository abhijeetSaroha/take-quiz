import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:takequiz/config/themes/app_colors.dart';
import 'package:takequiz/controllers/auth_controller.dart';
import 'package:takequiz/widgets/app_circle_button.dart';
import 'package:takequiz/widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack(
            //   children: [
            //     Positioned(
            //       left: 0,
            //       top: 0,
            //       child: AppCircleButton(
            //         child: const Icon(
            //           Icons.arrow_back_ios_new_rounded,
            //           color: Colors.white,
            //         ),
            //         onTap: () => Get.back(),
            //       ),
            //     ),
            //   ],
            // ),
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 60,
              ),
              child: Text(
                "This is a study app. You can use it as you want.",
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/icons/google.svg",
                    ),
                  ),
                  Center(
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
