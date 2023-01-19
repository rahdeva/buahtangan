import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/text-field/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_edit_controller.dart';

class PlannerEditView extends GetView<PlannerEditController> {
  const PlannerEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButtonWidget(),
                Container(
                  margin: const EdgeInsets.all(24.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    boxShadow: [dropShadow()],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: onSecondaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Edit",
                        style: projectTextTheme.subtitle2?.copyWith(
                          color: onSecondaryColor
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
                width: 100.w,
                constraints: BoxConstraints(
                  minHeight: 90.h
                ),
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
                    Row(
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://picsum.photos/300/300",
                                  ),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Positioned(
                                bottom: -4,
                                right: -4,
                                child: CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  radius: 12,
                                  child: IconButton(
                                    onPressed: (){},
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
                            decoration: const InputDecoration(
                              hintText: "Name",
                            ),
                            style: projectTextTheme.caption!.copyWith(
                              color: slate500
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Date",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Date",
                      hintText: "Your Date...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Event",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Event",
                      hintText: "Your Event...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Budget",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Budget",
                      hintText: "Your Budget...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Messages",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Messages",
                      hintText: "Your Messages...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Notes",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Notes",
                      hintText: "Your Notes...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Notification",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                      controller: controller.testC,
                      keyboardType: TextInputType.name,
                      labelText: "Notification",
                      hintText: "Your Notification...",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Gift List",
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_empty_box.png"
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "No gifts have been added yet",
                          style: projectTextTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: slate500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: slate500,
                          boxShadow: [dropShadow()],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add,
                              color: surfaceColor
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add gift from favorites",
                              style: projectTextTheme.bodyText2!.copyWith(
                                color: surfaceColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: slate500,
                          boxShadow: [dropShadow()],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add,
                              color: surfaceColor
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add gift from directory",
                              style: projectTextTheme.bodyText2!.copyWith(
                                color: surfaceColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          boxShadow: [dropShadow()],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: onSurfaceColor
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add Receiver",
                              style: projectTextTheme.button!.copyWith(
                                color: onSurfaceColor
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
