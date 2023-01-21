import 'package:buahtangan/app/modules/gift-planner/widgets/planner_list_builder.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/gift_planner_controller.dart';

class GiftPlannerView extends StatelessWidget {
  const GiftPlannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GiftPlannerController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  Container(
                    width: 100.w,
                    constraints: BoxConstraints(minHeight: 90.h),
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
    );
  }
}
