import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takequiz/bindings/initial_bindings.dart';
import 'package:takequiz/controllers/theme_controller.dart';
import 'package:takequiz/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     GetMaterialApp(
//       home: DataUploaderScreen(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }
