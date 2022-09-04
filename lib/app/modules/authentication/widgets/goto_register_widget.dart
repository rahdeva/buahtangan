import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GotoRegisterText extends StatelessWidget {
  const GotoRegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't have any account yet?", 
          style: projectTextTheme.bodyText2
        ),
        TextButton(
          onPressed: () => Get.toNamed(Routes.REGISTER), 
          child: Text(
            "Register!", 
            style: projectTextTheme.bodyText2?.copyWith(
              color: secondaryColor,
              fontWeight: FontWeight.bold
            )
          ),
        )
      ],
    );
  }
}