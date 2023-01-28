import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../themes/decoration.dart';

class PlannerTextFieldWidget extends StatelessWidget {
  const PlannerTextFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.maxLines,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
      ),
      child: TextField(
        style: projectTextTheme.bodyText2?.copyWith(
          fontWeight: FontWeight.w500,
          color: slate500
        ),
        controller: controller,
        keyboardType: keyboardType,
        autocorrect: false,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hoverColor: surfaceColor,
          fillColor: surfaceColor,
          focusColor: primaryColor,
          isDense: true,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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