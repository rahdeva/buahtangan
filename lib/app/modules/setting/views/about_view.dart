import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BackButtonWidget(),
              Container(
                width: Get.width,
                height: Get.height - 100,
                decoration: whiteContainerDecoration(),
                padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
                child: Column(
                  children: [
                    Text(
                      "About",
                      style: projectTextTheme.headline6?.copyWith(
                        color: onBackgroundColor
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
