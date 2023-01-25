import 'package:buahtangan/app/modules/gift-planner/widgets/add_gift_from_directory_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/add_planner_picture_receiver.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/empty_gift_list_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_label_text_field_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_primary_button.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/text-field/text_field_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_add_controller.dart';

class PlannerAddView extends StatelessWidget {
  const PlannerAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerAddController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BackButtonWidget(),
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
                        AddPlannerPictureReceiver(
                          controller: controller
                        ),
                        const SizedBox(height: 8),
                        const PlannerLabelTextField(
                          labelText: "Date"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Date",
                          hintText: "Your Date...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Event"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Event",
                          hintText: "Your Event...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Budget"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Budget",
                          hintText: "Your Budget...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Messages"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Messages",
                          hintText: "Your Messages...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notes"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Notes",
                          hintText: "Your Notes...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notification"
                        ),
                        TextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          labelText: "Notification",
                          hintText: "Your Notification...",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Gift List"
                        ),
                        const EmptyGiftListWidget(),
                        const SizedBox(height: 16),
                        const AddGiftFromDirectoryButton(),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Or",
                            style: projectTextTheme.caption!.copyWith(
                              color: onBackgroundColor
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const AddGiftFromDirectoryButton(),
                        const SizedBox(height: 40),
                        PlannerPrimaryButton(
                          onTap: () {
                            controller.createNewPlanner();
                          },
                          buttonText: "Add Receiver",
                        ),
                      ]
                    ),
                )
              ],
            ),
            ),
          ),
        );
      }
    );
  }
}