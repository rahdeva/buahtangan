import 'package:buahtangan/app/modules/gift-planner/controllers/planner_edit_controller.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

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