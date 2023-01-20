import 'package:buahtangan/app/themes/decoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class OtherPictureListItem extends StatelessWidget {
  final int index;
  // final VideoData mData;
  
  const OtherPictureListItem({
    Key? key, 
    required this.index, 
    // required this.mData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.fromLTRB(index == 0 ? 0 : 16, 8, 0, 8),
      child: InkWell(
        onTap: () {
          // Get.toNamed(
          //   PageName.VIDEO_DETAIL,
          //   arguments: VideoParam(
          //     url: mData.linkVideo,
          //     slug: mData.slug,
          //   ),
          // );
        },
        child: Container(
          width: 148,
          decoration: BoxDecoration(
            boxShadow: [dropShadow()],
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: "https://picsum.photos/300/300",
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
    );
  }
}
