import 'package:buahtangan/app/modules/authentication/controllers/login_controller.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/decoration.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
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
      child: Obx(
        () => TextField(
          style: projectTextTheme.subtitle1,
          controller: controller.passwordC,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.isHidden.value,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Your Password...",
            hoverColor: surfaceColor,
            fillColor: surfaceColor,
            focusColor: primaryColor,
            isDense: true,
            filled: true,
            suffixIcon: IconButton(
              onPressed: () => controller.isHidden.toggle(), 
              icon: Icon(
                controller.isHidden.isTrue ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
                color: primaryColor,
              )
            ),
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
      ),
    );
  }
}