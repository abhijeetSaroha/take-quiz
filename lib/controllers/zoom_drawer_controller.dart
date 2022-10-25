import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}

  void website() {}

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
