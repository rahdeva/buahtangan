import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GiftGridItem extends StatelessWidget {
  final int index;
  // final Hospital mData;
  final controller;

  const GiftGridItem({
    Key? key, 
    required this.index, 
    // required this.mData,
    this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed(Routes.GIFT_DETAIL);
          // AnalyticsService().setCurrentScreen(
          //   screenName: "Hospital Detail",
          //   root: PageName.DETAIL_HOSPITAL,
          // );
        },
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [dropShadow()]
          ),
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 148,
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
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
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
                        const SizedBox(width: 4),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: tertiaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 100.w - 250),
                              child: Text(
                                "Art",
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
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        "Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain Custom Keychain",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: projectTextTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 100.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/ic_money.png",
                                width: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Rp 100k-1000k+",
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
                            size: 12,
                            color: slate500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      );
  }
}
