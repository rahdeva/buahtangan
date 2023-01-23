import 'package:buahtangan/app/models/planner.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class DetailPlannerPictureAndReceiverWidget extends StatelessWidget {
  const DetailPlannerPictureAndReceiverWidget({
    Key? key,
    required this.planner,
  }) : super(key: key);

  final PlannerData? planner;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [dropShadow()],
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: planner?.pictureUrl ?? "",
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
        const SizedBox(width: 24),
        SizedBox(
          width: 100.w - 100 - 48 - 24,
          child: Text(
            planner?.receiver ?? "-",
            style: projectTextTheme.subtitle1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: onSurfaceColor
            ),
          ),
        ),
      ],
    );
  }
}