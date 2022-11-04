import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:takequiz/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void website() {
    Uri website = Uri(path: 'https://www.google.com');
    _launch(website);
  }

  void facebbok() {
    Uri website = Uri(path: 'https://www.facebook.com');
    _launch(website);
  }

  void email() {
    final Uri emailLaunchUrl = Uri(
      scheme: "mailTo",
      path: 'abhijeetsaroha677@gmail.com',
    );
    _launch(emailLaunchUrl);
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'could not launch $url';
    }
  }
}
