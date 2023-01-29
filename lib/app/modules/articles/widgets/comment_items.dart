import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/controllers/articles_detail_controller.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CommentListItem extends StatelessWidget {
  final int index;
  final Comment mData;
  final ArticlesDetailController controller;

  const CommentListItem({
    Key? key,
    required this.index,
    required this.mData,
    required this.controller,
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
              mData.userName ?? "-",
              style: projectTextTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w600, 
                color: onSurfaceColor
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat("dd MMMM yyyy").format(mData.date ?? DateTime.now()),
              style: projectTextTheme.bodyText2!.copyWith(
                fontSize: 10, 
                fontWeight: FontWeight.w400, 
                color: slate500
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mData.comment ?? "-",
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
