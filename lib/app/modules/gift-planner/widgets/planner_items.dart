import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/modules/gift-planner/controllers/gift_planner_controller.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class PlannerListItem extends StatelessWidget {
  final int index;
  final PlannerData mData;
  final GiftPlannerController controller;

  const PlannerListItem({
    Key? key, 
    required this.index, 
    required this.mData,
    required this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed(
            Routes.PLANNER_DETAIL
          );
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
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [dropShadow()]
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/400/400",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/img_square_placeholder.png",
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 100.w - 165,
                      child: Text(
                        mData.receiver ?? "-",
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
                      width: 100.w - 165,
                      child: Text(
                        "Valentine",
                        style: projectTextTheme.bodyText2!.copyWith(
                          color: onSurfaceColor
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w - 165,
                      child: Text(
                        "14 February 2023",
                        style: projectTextTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: slate500
                        ),
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
