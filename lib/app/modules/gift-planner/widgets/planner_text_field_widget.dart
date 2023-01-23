import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../themes/decoration.dart';

class PlannerTextFieldWidget extends StatelessWidget {
  const PlannerTextFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
      ),
      child: TextField(
        style: projectTextTheme.subtitle1,
        controller: controller,
        keyboardType: keyboardType,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hoverColor: surfaceColor,
          fillColor: surfaceColor,
          focusColor: primaryColor,
          isDense: true,
          filled: true,
          contentPadding: const EdgeInsets.all(20), 
          labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: primaryColor, width: 0.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: surfaceColor, width: 0.0)
          )
        ),
      ),
    );
  }
}