import 'package:buahtangan/app/modules/gift-directory/widgets/other_picture_items.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/gift_detail_controller.dart';

class GiftDetailView extends GetView<GiftDetailController> {
  const GiftDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
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
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://picsum.photos/300/300",
                          ),
                          fit: BoxFit.cover
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
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: blackColor
                            ),
                          ),
                        ]
                      ), 
                    )
                  ]
                ),
            )
          ],
        ),
      )),
    );
  }
}
