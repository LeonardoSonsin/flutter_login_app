import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Text(isLogin
              ? 'Log in with one of the following options.'
              : 'Sign up with one of the following options.'),
        ),
        Row(
          children: [
            buildExpandedButton(MdiIcons.google),
            const SizedBox(width: 16.0),
            buildExpandedButton(MdiIcons.apple),
          ],
        ),
      ],
    );
  }

  Expanded buildExpandedButton(IconData icon) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          minimumSize: const Size.fromHeight(65.0),
        ),
        child: Icon(icon, size: 30),
      ),
    );
  }
}
