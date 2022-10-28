import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_app/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

  void registerUser(
      BuildContext context, String email, String password, String name) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(context, email, password, name)
        .then((value) async {
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'uid': user?.uid,
        'name': name,
        'email': email,
        'password': password
      });
    });
  }
}
