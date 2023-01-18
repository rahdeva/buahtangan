import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [dropShadow()],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30), 
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                      child: Text(
                        "Gift Detail",
                        style: projectTextTheme.headline6?.copyWith(
                          color: onBackgroundColor
                        ),
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
