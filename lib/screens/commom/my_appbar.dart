import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: isLogin
          ? const Text(
              'Log in',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            )
          : Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1, color: Colors.white24)),
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 100.0);
}
