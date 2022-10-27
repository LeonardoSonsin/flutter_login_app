import 'package:flutter/material.dart';
import 'package:flutter_login_app/controllers/register_controller.dart';
import 'package:flutter_login_app/screens/commom/google_apple_button.dart';
import 'package:flutter_login_app/screens/commom/my_appbar.dart';
import 'package:get/get.dart';

import '../commom/custom_text_form_field.dart';
import '../commom/login_signup_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(RegisterController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(isLogin: false),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const OtherOptions(isLogin: false),
                      const SizedBox(height: 32.0),
                      textFormFields(controller),
                      const SizedBox(height: 32.0),
                      LoginSignButton(
                          isLogin: false,
                          formKey: formKey,
                          loginController: null,
                          registerController: controller),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column textFormFields(RegisterController controller) {
    return Column(
      children: [
        CustomTextFormField(
            text: 'Name',
            hintText: 'Oliver Cederborg',
            keyboardType: TextInputType.name,
            controller: controller.name,
            isObscure: false),
        const SizedBox(height: 18.0),
        CustomTextFormField(
            text: 'Email',
            hintText: 'tim@apple.com',
            keyboardType: TextInputType.emailAddress,
            controller: controller.email,
            isObscure: false),
        const SizedBox(height: 18.0),
        CustomTextFormField(
            text: 'Password',
            hintText: 'Enter your password',
            keyboardType: TextInputType.text,
            controller: controller.password,
            isObscure: true),
      ],
    );
  }
}
