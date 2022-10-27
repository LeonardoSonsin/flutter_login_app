import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.text,
      required this.hintText,
      required this.keyboardType,
      required this.controller,
      required this.isObscure})
      : super(key: key);

  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscure;

  final TextEditingController controller;

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(text, style: const TextStyle(fontSize: 18.0)),
        ),
        TextFormField(
          obscureText: isObscure,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              hintText: hintText),
          validator: (String? value) {
            if (valueValidator(value)) {
              return 'Campo obrigatório!';
            }
            return null;
          },
        ),
      ],
    );
  }
}
