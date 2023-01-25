import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/back_and_edit_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/detail_planner_picture_and_receiver_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/empty_gift_list_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_disable_text_field_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_label_text_field_widget.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_detail_controller.dart';

class PlannerDetailView extends StatelessWidget {
  const PlannerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerDetailController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: FutureBuilder<Planner?>(
                  future: controller.getPlannerDetail(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final planner = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const BackAndEditButton(),
                          Container(
                              width: 100.w,
                              constraints: BoxConstraints(minHeight: 90.h),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                boxShadow: [dropShadow()],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30), 
                                  topRight: Radius.circular(30), 
                                )
                              ),
                              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailPlannerPictureAndReceiverWidget(
                                    planner: planner
                                  ),
                                  const SizedBox(height: 8),
                                  const 
                                  PlannerLabelTextField(labelText: "Date"),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.date.toString(),
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Event"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.event ?? "-",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Budget"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.budget ?? "-",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Messages"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.messages ?? "-",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Notes"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.notes ?? "-",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Notification"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.testC,
                                    keyboardType: TextInputType.name,
                                    hintText: planner.notifDate.toString(),
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Gift List"
                                  ),
                                  const SizedBox(height: 8),
                                  const EmptyGiftListWidget(),
                                ]
                              ),
                          )
                        ],
                      );
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}