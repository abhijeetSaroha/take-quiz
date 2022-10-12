import 'package:get/get.dart';
import 'package:takequiz/controllers/auth_controller.dart';
import 'package:takequiz/controllers/theme_controller.dart';
import 'package:takequiz/services/firebase_storage_service.dart';
import 'dart:html';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    Get.put(FirebaseStorageService());
  }
}
