import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class PlannerDisableTextFieldWidget extends StatelessWidget {
  const PlannerDisableTextFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
      ),
      child: TextField(
        readOnly: true,
        style: projectTextTheme.subtitle1,
        controller: controller,
        keyboardType: keyboardType,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: surfaceColor,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          labelStyle: projectTextTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
            color: slate500
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}