import 'package:buahtangan/app/modules/gift-planner/controllers/planner_add_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/avatar_grid_builder.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/bottom-sheet/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future avatarPictureBottomSheet(
  BuildContext context, {
  required PlannerAddController controller,
}) {
  return showBarBottomSheet(context, builder: (_) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close_rounded,
                        size: 24,
                        color: onBackgroundColor,
                      )),
                  Expanded(
                    child: Text(
                      "Choose Avatar",
                      style: projectTextTheme.bodyText2!.copyWith(
                        color: onBackgroundColor
                      )
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              AvatarGridBuilder(controller)
            ],
          ),
        ),
      ),
    );
  });
}
