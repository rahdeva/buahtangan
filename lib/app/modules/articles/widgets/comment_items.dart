import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommentListItem extends StatelessWidget {
  final int index;
  // final Hospital mData;
  final controller;

  const CommentListItem({
    Key? key, 
    required this.index, 
    // required this.mData,
    this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          width: 100.w,
          margin: EdgeInsets.fromLTRB(0, index == 0 ? 16 : 0, 0, 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [dropShadow()]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User",
                style: projectTextTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: onSurfaceColor
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "16 Juni 2022",
                style: projectTextTheme.bodyText2!.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: slate500
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Lorem ipsum dolor sit amet, consectetur Fames adipiscing elit. Fames tempus, ",
                style: projectTextTheme.bodyText2!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: onSurfaceColor
                ),
              ),
            ],
          )
        ),
      );
  }
}
