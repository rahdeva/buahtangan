import 'package:buahtangan/app/modules/gift-planner/widgets/add_gift_from_directory_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/add_gift_from_favorites_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/avatar_picture_bottom_sheet.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/date_picker_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/empty_gift_list_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_label_text_field_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_text_field_widget.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/dropdown/dropdown_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_edit_controller.dart';
import '../widgets/planner_primary_button.dart';

class PlannerEditView extends StatelessWidget {
  const PlannerEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerEditController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackAndSaveButton(
                    controller: controller,
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
                        EditPlannerPictureReceiver(
                          controller: controller,
                        ),
                        const SizedBox(height: 8),
                        const PlannerLabelTextField(
                          labelText: "Date"
                        ),
                        DatePickerWidget(
                          controller: controller,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Event"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.eventValue.value,
                          items: controller.eventItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.eventValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Budget"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.budgetValue.value,
                          items: controller.budgetItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.budgetValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Messages"
                        ),
                        PlannerTextFieldWidget(
                          controller: controller.messagesC,
                          keyboardType: TextInputType.name,
                          hintText: "Messages",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notes"
                        ),
                        PlannerTextFieldWidget(
                          controller: controller.notesC,
                          keyboardType: TextInputType.name,
                          hintText: "Notes",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notification"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.notifValue.value,
                          items: controller.notifItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.notifValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Gift List"
                        ),
                        Obx(
                          () => controller.giftsSlugs.first.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const EmptyGiftListWidget(),
                                  const SizedBox(height: 16),
                                  const AddGiftFromFavoritesButton(),
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
                                ],
                              )
                            : Text(controller.giftsSlugs.first)
                        ),
                        const SizedBox(height: 40),
                        PlannerPrimaryButton(
                          onTap: () {
                            controller.deletePlanner();
                          },
                          buttonText: "Delete Receiver",
                          containerColor: secondaryColor,
                          icon: Icons.delete,
                          textButtonColor: surfaceColor,
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

class EditPlannerPictureReceiver extends StatelessWidget {
  const EditPlannerPictureReceiver({
    Key? key, 
    required this.controller,
  }) : super(key: key);

  final PlannerEditController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [dropShadow()],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Obx(
                () => controller.avatar.value == ""
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/img_square_placeholder.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: controller.avatar.value,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/img_square_placeholder.png",
                        fit: BoxFit.cover,
                      )
                    ),
              ),
            ),
            Positioned(
                bottom: -4,
                right: -4,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 12,
                  child: IconButton(
                    onPressed: () async => avatarPictureBottomSheet(
                      context, 
                      controller: controller
                    ),
                    icon: Icon(
                      size: 9,
                      Icons.edit,
                      color: onSecondaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 100.w - 100 - 48 - 24,
          child: TextField(
            controller: controller.receiverC,
            decoration: const InputDecoration(
              hintText: "Name",
            ),
            minLines: 1,
            maxLines: 2,
            style: projectTextTheme.caption!.copyWith(
              color: onBackgroundColor
            ),
          ),
        ),
      ],
    );
  }
}

class BackAndSaveButton extends StatelessWidget {
  const BackAndSaveButton({
    Key? key, 
    required this.controller,
  }) : super(key: key);

  final PlannerEditController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButtonWidget(),
        InkWell(
          onTap: (){
            controller.updatePlanner();
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: const EdgeInsets.all(24.0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: tertiaryColor,
              boxShadow: [dropShadow()],
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                Icon(
                  Icons.save,
                  color: onSurfaceColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "Save",
                  style: projectTextTheme.subtitle2?.copyWith(
                    color: onSurfaceColor
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
