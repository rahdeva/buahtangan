import '../../../modules/authentication/controllers/login_controller.dart';
import '../../../themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithGoogleWidget extends StatelessWidget {
  const LoginWithGoogleWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => controller.loginGoogle(),
            child: Container(
              decoration: shadowDecoration(),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/google.svg"),
                ),
              ),
            ),
          ),
          const SizedBox(width: 50),
          InkWell(
            onTap: () => controller.loginFacebook(),
            child: Container(
              decoration: shadowDecoration(),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/facebook.svg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}