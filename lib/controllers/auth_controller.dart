// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takequiz/app_logger.dart';
import 'package:takequiz/firebase_ref/references.dart';
import 'package:takequiz/screens/login/login_screen.dart';
import 'package:takequiz/widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
      },
    );
    navigateToIntroduction();
  }

  void signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication _authAccount =
            await account.authentication;
        final AuthCredential _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(_credential);
        userCredential.user;
        await saveUser(account);
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(
        onTap: () {
          Get.back();
          navigateToLoginPage();
          // Navigate to login page
        },
      ),
      barrierDismissible: false,
    );
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
