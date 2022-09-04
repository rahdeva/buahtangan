import 'package:buahtangan/app/modules/authentication/controllers/login_controller.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
      ),
      child: TextField(
        style: projectTextTheme.subtitle1,
        controller: controller.emailC,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Your Email...",
          hoverColor: surfaceColor,
          fillColor: surfaceColor,
          focusColor: primaryColor,
          isDense: true,
          filled: true,
          contentPadding: const EdgeInsets.all(20), 
          labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: primaryColor, width: 0.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: surfaceColor, width: 0.0)
          )
        ),
      ),
    );
  }
}