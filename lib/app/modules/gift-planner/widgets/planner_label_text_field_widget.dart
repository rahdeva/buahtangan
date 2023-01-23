import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class PlannerLabelTextField extends StatelessWidget {
  const PlannerLabelTextField({
    Key? key, 
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        labelText,
        style: projectTextTheme.subtitle1?.copyWith(
          color: onSurfaceColor,
        ),
      ),
    );
  }
}