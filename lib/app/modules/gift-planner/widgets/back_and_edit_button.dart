import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackAndEditButton extends StatelessWidget {
  const BackAndEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButtonWidget(),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: (){
            Get.toNamed(
              Routes.PLANNER_ADD
            );
          },
          child: Container(
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
          ),
        )
      ],
    );
  }
}