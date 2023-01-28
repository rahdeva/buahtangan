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
import 'package:intl/intl.dart';
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
                      controller.fillDataTextController(planner);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BackAndEditButton(
                            plannerId: planner.id ?? "",
                          ),
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
                                  const PlannerLabelTextField(labelText: "Date"),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.dateC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Date",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Event"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.eventC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Event",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Budget"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.budgetC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Budget",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Messages"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.messagesC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Messages",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Notes"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.notesC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Notes",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Notification"
                                  ),
                                  PlannerDisableTextFieldWidget(
                                    controller: controller.notifC,
                                    keyboardType: TextInputType.none,
                                    hintText: "Notification",
                                  ),
                                  const PlannerLabelTextField(
                                    labelText: "Gift List"
                                  ),
                                  const SizedBox(height: 8),
                                  Obx(
                                    () => controller.giftsSlugs.first.isEmpty
                                      ? const EmptyGiftListWidget()
                                      : Text(controller.giftsSlugs.first)
                                  )
                                ]
                              ),
                          )
                        ],
                      );
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
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