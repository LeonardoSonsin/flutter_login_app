import 'package:flutter/material.dart';
import 'package:flutter_login_app/controllers/register_controller.dart';

import '../../controllers/login_controller.dart';

class LoginSignButton extends StatelessWidget {
  const LoginSignButton(
      {Key? key,
      required this.isLogin,
      required this.formKey,
      required this.registerController,
      required this.loginController})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final RegisterController? registerController;
  final LoginController? loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              isLogin
                  ? LoginController.instance.loginUser(
                      context,
                      loginController!.email.text.trim(),
                      loginController!.password.text.trim())
                  : RegisterController.instance.registerUser(
                      context,
                      registerController!.email.text.trim(),
                      registerController!.password.text.trim(),
                      registerController!.name.text.trim());
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            minimumSize: const Size.fromHeight(65.0),
          ),
          child: Text(
            isLogin ? 'Log in' : 'Create Account',
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                isLogin ? 'Dont have an account?' : 'Already have an account?'),
            TextButton(
              onPressed: () {
                isLogin
                    ? Navigator.pushNamed(context, '/register')
                    : Navigator.pop(context);
              },
              child: Text(isLogin ? 'Sign up' : 'Log in',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}
