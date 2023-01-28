// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key, 
    required this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: surfaceColor,
        boxShadow: [dropShadow()],
      ),
      child: Obx(
        () => InkWell(
          onTap: () => controller.pickDate(context),
          child: ListTile(
            dense: true,
            contentPadding : const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            title: Text(
              controller.dateResult.value,
              style: projectTextTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w500,
                color: slate500
              ),
            ),
            trailing: Icon(
              Icons.date_range_rounded,
              size: 20,
              color: onSurfaceColor,
            )
          ),
        ),
      ),
    );
  }
}