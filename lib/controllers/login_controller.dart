import 'package:flutter/cupertino.dart';
import 'package:flutter_login_app/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(BuildContext context, String email, String password) {
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(context, email, password);
  }
}
