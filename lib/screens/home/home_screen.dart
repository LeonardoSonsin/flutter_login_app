import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/authentication_repository/authentication_repository.dart';
import '../commom/on_back_pressed_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User user = _auth.currentUser!;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showReturnAlertDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text(user.email![0].toUpperCase(),
                      style: const TextStyle(fontSize: 30.0)),
                ),
                accountName: Text(user.uid),
                accountEmail: Text(user.email!),
              ),
              ListTile(
                onTap: () {
                  AuthenticationRepository.instance.logout();
                },
                title: const Text('Leave'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
