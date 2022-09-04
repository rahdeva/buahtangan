import '../../../modules/authentication/controllers/login_controller.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberMeForgotPass extends StatelessWidget {
  const RememberMeForgotPass({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Row(
            children: [
              Checkbox(
                value: controller.rememberme.value,
                onChanged: (_) => controller.rememberme.toggle(),
              ),
              Text(
                "Remember me", 
                style: projectTextTheme.caption?.copyWith(
                  color: slate500
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => controller.resetDialog(),
          child: Text(
            "forgot password?",
            textAlign: TextAlign.start,
            style: projectTextTheme.overline?.copyWith(
              color: slate500
            ),
          ),
        ),
      ],
    );
  }
}