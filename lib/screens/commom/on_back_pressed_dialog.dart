import 'package:flutter/material.dart';
import 'package:flutter_login_app/repository/authentication_repository/authentication_repository.dart';

Future<bool?> showReturnAlertDialog(BuildContext context) => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Do you really want to leave the application?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
              AuthenticationRepository.instance.logout();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
