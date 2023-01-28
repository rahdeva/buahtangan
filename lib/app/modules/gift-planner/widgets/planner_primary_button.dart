import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlannerPrimaryButton extends StatelessWidget {
  const PlannerPrimaryButton({
    Key? key, 
    required this.buttonText,
    required this.onTap, 
    this.containerColor, 
    this.icon, 
    this.textButtonColor, 
  }) : super(key: key);

  final String buttonText;
  final Function() onTap;
  final Color? containerColor;
  final IconData? icon;
  final Color? textButtonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: containerColor ?? tertiaryColor,
          boxShadow: [dropShadow()],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.add,
              color: onSurfaceColor
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: projectTextTheme.button!.copyWith(
                color: textButtonColor ?? onSurfaceColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}