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
                  ]
                ),
            )
          ],
        ),
      )),
    );
  }
}
