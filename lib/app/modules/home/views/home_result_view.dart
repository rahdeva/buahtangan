import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/back_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_result_controller.dart';

class HomeResultView extends GetView<HomeResultController> {
  const HomeResultView({Key? key}) : super(key: key);

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
                height: Get.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [dropShadow()],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30), 
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                      child: Text(
                        "Change Password",
                        style: projectTextTheme.headline6?.copyWith(
                          color: onBackgroundColor
                        ),
                      ),
                    ),
                  ]
                ),
            )
          ],
        ),
      )),
    );
  }
}
