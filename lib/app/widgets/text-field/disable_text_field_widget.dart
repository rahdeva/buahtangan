import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class DisableTextFieldWidget extends StatelessWidget {
  const DisableTextFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;

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
          labelText: labelText,
          filled: true,
          fillColor: slate300,
          isDense: true,
          contentPadding: const EdgeInsets.all(22),
          labelStyle: projectTextTheme.subtitle1?.copyWith(
            color: onSurfaceColor
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