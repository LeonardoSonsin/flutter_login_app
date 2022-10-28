import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../repository/authentication_repository/authentication_repository.dart';
import '../commom/on_back_pressed_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = ' ';
  String email = ' ';
  late DocumentSnapshot snapshot;

  Future<void> getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        snapshot = documentSnapshot;
        name = snapshot['name'];
        email = snapshot['email'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
                  child: Text(name[0].toUpperCase(),
                      style: const TextStyle(fontSize: 30.0)),
                ),
                accountName: Text(name),
                accountEmail: Text(email),
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
