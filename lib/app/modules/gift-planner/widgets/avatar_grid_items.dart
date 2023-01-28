import 'package:buahtangan/app/models/avatar.dart';
import 'package:buahtangan/app/models/gift.dart';
import 'package:buahtangan/app/modules/gift-directory/controllers/gift_directory_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/controllers/planner_add_controller.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AvatarGridItem extends StatelessWidget {
  final int index;
  final Avatar mData;
  final PlannerAddController controller;

  const AvatarGridItem({
    Key? key, 
    required this.index, 
    required this.mData,
    required this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.avatar.value = mData.avatarUrl ?? "";
        Get.back();
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
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: CachedNetworkImage(
            imageUrl: mData.avatarUrl ?? "",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
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
        )
      ),
    );
  }
}
