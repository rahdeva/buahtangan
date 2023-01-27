import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/controllers/articles_controller.dart';
import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ArticleListItem extends StatelessWidget {
  final int index;
  final Article mData;
  final ArticlesController controller;

  const ArticleListItem({
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
            Routes.ARTICLES_DETAIL,
            arguments: {'slug': mData.slug}
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
                  width: 120,
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: CachedNetworkImage(
                      imageUrl: "https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
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
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 100.w - 220,
                      child: Text(
                        mData.title ?? "-",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
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
