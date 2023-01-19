import 'package:buahtangan/app/modules/gift-planner/widgets/planner_list_builder.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/gift_planner_controller.dart';

class GiftPlannerView extends GetView<GiftPlannerController> {
  const GiftPlannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
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
                    "Be more organized in your gift-giving",
                    style: projectTextTheme.subtitle2?.copyWith(
                      color: slate500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(color: slate400),
                  ListPlannerBuilder(controller),
                ]
              ),
            )
          ],
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(
              Routes.PLANNER_ADD
            );
          },
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.add,
            size: 24,
            color: surfaceColor,
          ),
        ),
      ),
    );
  }
}
