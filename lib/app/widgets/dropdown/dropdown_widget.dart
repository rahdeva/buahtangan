import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.dropdownValue,
    required this.items,
    required this.onChanged, 
  }) : super(key: key);

  final String dropdownValue;
  final List<DropdownMenuItem<String>> items;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
        borderRadius: BorderRadius.circular(20),
        color: surfaceColor,
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none
          )
        ),
        value: dropdownValue,
        style: projectTextTheme.bodyText2?.copyWith(
          fontWeight: FontWeight.w500,
          color: slate500
        ),
        icon: RotatedBox(
          quarterTurns: 1,
          child: Icon(
            Icons.play_arrow_rounded,
            size: 20,
            color: onSurfaceColor,
          ),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
