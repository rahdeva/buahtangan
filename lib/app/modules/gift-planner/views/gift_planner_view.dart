import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/back-button/back_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gift_planner_controller.dart';

class GiftPlannerView extends GetView<GiftPlannerController> {
  const GiftPlannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              height: Get.height,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [dropShadow()],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), 
                  topRight: Radius.circular(30), 
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gift Planner",
                      style: projectTextTheme.headline6?.copyWith(
                      color: onBackgroundColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Discover things you don't know about",
                    style: projectTextTheme.subtitle2?.copyWith(
                      color: slate500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: const Divider()
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
