import 'package:buahtangan/app/models/article.dart';
import 'package:buahtangan/app/modules/articles/widgets/comment_list_builder.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/articles_detail_controller.dart';

class ArticlesDetailView extends StatelessWidget {
  const ArticlesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesDetailController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
                child: FutureBuilder<Article?>(
                  future: controller.getArticleDetail(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final article = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const BackButtonWidget(),
                        Container(
                            width: 100.w,
                            constraints: BoxConstraints(minHeight: 90.h),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: [dropShadow()],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30), 
                                topRight: Radius.circular(30), 
                              )
                            ),
                            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                            child: SafeArea(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 100.w,
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
                                            "assets/images/img_rectangle_placeholder.png",
                                            fit: BoxFit.cover,
                                          )
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Container(
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          boxShadow: [dropShadow()],
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              article.title ?? "-",
                                              style: projectTextTheme.headline6?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: onSurfaceColor
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Ngurah Deva",
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
                                            const SizedBox(height: 16),
                                            Text(
                                              "A music box is a mechanical device that plays a musical tune when a handle or lever is turned. Music boxes come in a variety of shapes and sizes, and can be made of a variety of materials, such as wood, metal, or glass.\n\nGifting someone a music box can be a thoughtful and sentimental gesture. It can be a special keepsake that the recipient can treasure for years to come. A music box can be especially meaningful if it plays a tune that is special to the recipient, such as a song from their childhood, a song that holds special memories, or a tune that represents a special place or occasion.\n\nOverall, it is a good idea to keep the recipient's interests and preferences in mind and choose a music box that you think they will appreciate and enjoy.",
                                              textAlign: TextAlign.justify,
                                              style: projectTextTheme.bodyText2!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.thumb_up_outlined,
                                                      color: onSurfaceColor,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "200",
                                                      style: projectTextTheme.caption!.copyWith(
                                                        color: onSurfaceColor
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Icon(
                                                      IconlyLight.chat,
                                                      color: onSurfaceColor,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "200",
                                                      style: projectTextTheme.caption!.copyWith(
                                                        color: onSurfaceColor
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Image.asset(
                                                    "assets/images/ic_share.png",
                                                    width: 24,
                                                  ),
                                                )
                                              ],
                                            )
                                          ]
                                        ), 
                                      ),
                                      const SizedBox(height: 24),
                                      Container(
                                        width: 100.w,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Comments",
                                          style: projectTextTheme.headline6!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: onBackgroundColor
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          boxShadow: [dropShadow()],
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(
                                              IconlyLight.chat,
                                              color: slate500,
                                            ),
                                          ),
                                          title: TextField(
                                            decoration: const InputDecoration(
                                              hintText: "Add Comment",
                                            ),
                                            style: projectTextTheme.caption!.copyWith(
                                              color: slate500
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.send,
                                            color: slate500,
                                          ),
                                        ),
                                      ),
                                      ListCommentBuilder(controller),
                                    ]
                                  )
                          ),
                        ),
                      ],
                    );
                    }
                    else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
              ),
            ),
          )
        );
      }
    );
  }
}
