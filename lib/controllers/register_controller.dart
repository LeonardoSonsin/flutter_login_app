import 'package:flutter/cupertino.dart';
import 'package:flutter_login_app/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

  void registerUser(BuildContext context, String email, String password) {
      AuthenticationRepository.instance.createUserWithEmailAndPassword(context, email, password);
  }
}
