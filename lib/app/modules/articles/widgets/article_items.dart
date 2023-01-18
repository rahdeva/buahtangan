import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ArticleListItem extends StatelessWidget {
  final int index;
  // final Hospital mData;
  final controller;

  const ArticleListItem({
    Key? key, 
    required this.index, 
    // required this.mData,
    this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Get.toNamed(
          //   PageName.DETAIL_HOSPITAL, 
          //   arguments: [mData.slug, false]
          // );
          // AnalyticsService().setCurrentScreen(
          //   screenName: "Hospital Detail",
          //   root: PageName.DETAIL_HOSPITAL,
          // );
        },
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 100.w,
          margin: EdgeInsets.fromLTRB(0, index == 0 ? 16 : 0, 0, 16),
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [dropShadow()]
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 100.w - 220,
                      child: Text(
                        controller.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: projectTextTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w - 220,
                      child: Row(
                        children: [
                          Text(
                            "12d ago",
                            style: projectTextTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: slate500
                            ),
                          ),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            radius: 2.5,
                            backgroundColor: slate300,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "13m read",
                            style: projectTextTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: slate500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      );
  }
}