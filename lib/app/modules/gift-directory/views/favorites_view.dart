import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(
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
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                            child: Text(
                              "Favorites",
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
              ),
            ),
          ),
        );
      }
    );
  }
}
