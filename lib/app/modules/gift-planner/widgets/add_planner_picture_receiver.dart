import 'package:buahtangan/app/modules/gift-planner/controllers/planner_add_controller.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/avatar_picture_bottom_sheet.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AddPlannerPictureReceiver extends StatelessWidget {
  const AddPlannerPictureReceiver({
    Key? key, 
    required this.controller,
  }) : super(key: key);
  
  final PlannerAddController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [dropShadow()],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Obx(
                () => controller.avatar.value == ""
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/img_square_placeholder.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: controller.avatar.value,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
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
              ),
            ),
            Positioned(
                bottom: -4,
                right: -4,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 12,
                  child: IconButton(
                    onPressed: () async => avatarPictureBottomSheet(
                      context, 
                      controller: controller
                    ),
                    icon: Icon(
                      size: 9,
                      Icons.edit,
                      color: onSecondaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 100.w - 100 - 48 - 24,
          child: TextField(
            controller: controller.nameC,
            decoration: const InputDecoration(
              hintText: "Name",
            ),
            minLines: 1,
            maxLines: 2,
            style: projectTextTheme.caption!.copyWith(
              color: onBackgroundColor
            ),
          ),
        ),
      ],
    );
  }
}