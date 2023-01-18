import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GiftListItem extends StatelessWidget {
  final int index;
  // final Hospital mData;
  final controller;

  const GiftListItem({
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
          child: Row(
            children: [
              Container(
                width: 100,
                constraints: const BoxConstraints(maxHeight: 300, minHeight: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [dropShadow()]
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: 6,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 100.w - 250),
                              child: Text(
                                "Physical",
                                maxLines: 1,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: projectTextTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: onSecondaryColor
                                ),
                              ),
                            ),
                          ),
                        SizedBox(width: 8,),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: tertiaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 100.w - 250),
                              child: Text(
                                "Art & Decor",
                                maxLines: 1,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: projectTextTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: onTertiaryColor
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: 100.w - 180,
                      child: Text(
                        "Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: projectTextTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w - 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "12d ago",
                                style: projectTextTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: slate500
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_horiz_rounded,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      );
  }
}
