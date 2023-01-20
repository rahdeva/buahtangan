import 'package:buahtangan/app/modules/gift-directory/widgets/comment_list_builder.dart';
import 'package:buahtangan/app/modules/gift-directory/widgets/other_picture_items.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/dotted_line_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/gift_detail_controller.dart';

class GiftDetailView extends StatelessWidget {
  const GiftDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GiftDetailController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.refreshPage,
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButtonWidget(),
                      Container(
                        margin: const EdgeInsets.all(24.0),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          boxShadow: [dropShadow()],
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border_rounded,
                              color: surfaceColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Add to Favorite",
                              style: projectTextTheme.subtitle2?.copyWith(
                                color: onSecondaryColor
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        boxShadow: [dropShadow()],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30), 
                          topRight: Radius.circular(30), 
                        )
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
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
                                "assets/images/img_square_placeholder.png",
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          Container(
                            height: 106,
                            margin: const EdgeInsets.only(top: 8, bottom: 16),
                            child: ListView.builder(
                              // itemCount: data.length > 3 ? 3 : data.length,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return OtherPictureListItem(
                                  index: index,
                                  // mData: data[index],
                                );
                              },
                            ),
                          ),
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
                                  "Music Box",
                                  style: projectTextTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: onSurfaceColor
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    const SizedBox(width: 8),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: tertiaryColor,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(maxWidth: 100.w - 250),
                                          child: Text(
                                            "Art & Decor",
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
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              boxShadow: [dropShadow()],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/ic_money.png"
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Budget Range",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText1!.copyWith(
                                        color: onBackgroundColor
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "100.000-1.000.000 Rupiah",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText2!.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: slate500
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/ic_event.png"
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Suitable Event",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText1!.copyWith(
                                        color: onBackgroundColor
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Christmas, Birthday, Valentine, Anniversary",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText2!.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: slate500
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/ic_receiver.png"
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Suitable Receiver",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText1!.copyWith(
                                        color: onBackgroundColor
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Her, Him, Couple",
                                      textAlign: TextAlign.justify,
                                      style: projectTextTheme.bodyText2!.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: slate500
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          InkWell(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: tertiaryColor,
                                boxShadow: [dropShadow()],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: onSurfaceColor
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Add to Planner",
                                    style: projectTextTheme.button!.copyWith(
                                      color: onSurfaceColor
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLineWidget(
                                dashColor: Colors.black,
                                dashHeight: 2,
                                dashWidth: 8,
                                totalWidth: 100.w/2 - 88,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "How to Get",
                                style: projectTextTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: onBackgroundColor
                                ),
                              ),
                              const SizedBox(width: 16),
                              DottedLineWidget(
                                dashColor: Colors.black,
                                dashHeight: 2,
                                dashWidth: 8,
                                totalWidth: 100.w/2 - 88,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
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
                                  Icons.store,
                                  size: 24,
                                  color: onSurfaceColor,
                                ),
                              ),
                              title: Text(
                                "Jewelry Store",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.link,
                                  size: 24,
                                  color: onSurfaceColor,
                                ),
                              ),
                              title: Text(
                                "See on this website",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/ic_shopee.png",
                                  width: 24,
                                ),
                              ),
                              title: Text(
                                "See on Shopee",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/ic_tokopedia.png",
                                  width: 24,
                                ),
                              ),
                              title: Text(
                                "See on Tokopedia",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/ic_youtube.png",
                                  width: 24,
                                ),
                              ),
                              title: Text(
                                "See tutorial on Youtube",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  "assets/images/ic_tutorial.png",
                                  width: 24,
                                ),
                              ),
                              title: Text(
                                "See tutorial here",
                                textAlign: TextAlign.justify,
                                style: projectTextTheme.bodyText1!.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: onSurfaceColor,
                              ),
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
                      ),
                  )
                ],
              ),
              ),
            ),
          ),
        );
      }
    );
  }
}
