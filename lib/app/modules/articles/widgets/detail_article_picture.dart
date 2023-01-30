import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class DetailArticlePicture extends StatelessWidget {
  const DetailArticlePicture({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100.w,
      decoration: BoxDecoration(
        boxShadow: [dropShadow()],
        borderRadius: BorderRadius.circular(15),
      ),
      child: CachedNetworkImage(
        imageUrl: article.pictureUrl ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            color: surfaceColor
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
          "assets/images/img_rectangle_placeholder.png",
          fit: BoxFit.cover,
        )
      ),
    );
  }
}