import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlannerPrimaryButton extends StatelessWidget {
  const PlannerPrimaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}