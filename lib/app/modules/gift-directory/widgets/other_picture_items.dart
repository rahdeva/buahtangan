import 'package:buahtangan/app/themes/decoration.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      height: Get.height,
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
            image: const DecorationImage(
              image: NetworkImage(
                "https://picsum.photos/300/300",
              ),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}
