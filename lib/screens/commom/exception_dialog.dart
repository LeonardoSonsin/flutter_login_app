import 'package:flutter/material.dart';

showExceptionDialog(
  BuildContext context, {
  required String content,
  String title = "An error occurred!",
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(children: [
          const Icon(
            Icons.warning,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ]),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "OK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    },
  );
}
