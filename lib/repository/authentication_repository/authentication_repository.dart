import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_app/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:flutter_login_app/screens/commom/exception_dialog.dart';
import 'package:flutter_login_app/screens/home/home_screen.dart';
import 'package:flutter_login_app/screens/login/login_screen.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showExceptionDialog(context, content: ex.message);
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      showExceptionDialog(context, content: ex.message);
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showExceptionDialog(context, content: ex.message);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      showExceptionDialog(context, content: ex.message);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
