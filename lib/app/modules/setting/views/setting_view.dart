import 'package:buahtangan/app/models/userData.dart';
import 'package:buahtangan/app/modules/setting/widgets/setting_widget.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/setting_controller.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
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
                    StreamBuilder<DocumentSnapshot<UserData>>(
                      stream: controller.getProfile(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          final user = snapshot.data!.data()!;
                          return Column(
                            children: [
                              Container(
                                decoration: shadowDecoration(),
                                margin: const EdgeInsets.all(25.0),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: user.profile ?? "https://ui-avatars.com/api/?size=120&name=${user.name}",
                                        imageBuilder: (context, imageProvider) => CircleAvatar(
                                          radius: 60,
                                          backgroundImage: imageProvider,
                                        ),
                                        placeholder: (context, url) => Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.white,
                                          child: const CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => const CircleAvatar(
                                          radius: 60,
                                          backgroundImage: AssetImage(
                                            "assets/images/img_square_placeholder.png"
                                          ),
                                        )
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: secondaryColor,
                                          radius: 15,
                                          child: IconButton(
                                            onPressed: () => controller.pickImage(), 
                                            icon: Icon(
                                              size: 15,
                                              Icons.edit,
                                              color: onSecondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                user.name ?? "-",
                                style: projectTextTheme.headline6?.copyWith(
                                  color: onPrimaryColor
                                ),
                              ),
                            ],
                          );
                        }
                        else{
                          return Container(
                            margin: const EdgeInsets.all(25.0),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  "assets/images/img_square_placeholder.png"
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: 100.w,
                      constraints: BoxConstraints(
                        minHeight: 62.h,
                      ),
                      padding: const EdgeInsets.only(bottom: 50, top: 24),
                      decoration: whiteContainerDecoration(),
                      child: Column(
                        children: [
                          SettingWidgets(
                            leading : IconlyBold.edit,
                            title : "Edit Profile",
                            onTap: () => Get.toNamed(Routes.EDIT_PROFIL),
                          ),
                          SettingWidgets(
                            leading : IconlyBold.lock,
                            title : "Change Password",
                            onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                          ),
                          SettingWidgets(
                            leading : IconlyBold.message,
                            title : "Send Feedback",
                            onTap: () => Get.defaultDialog(
                              title: "Send Feedback",
                              titlePadding: const EdgeInsets.only(top: 32),
                              titleStyle: projectTextTheme.headline6!.copyWith(
                                color: onBackgroundColor
                              ),
                              content: Container(
                                margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Center(
                                      child: RatingBar(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        glow: false,
                                        unratedColor: Colors.transparent,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        ratingWidget: RatingWidget(
                                          full: Icon(
                                            Icons.star_rounded,
                                            color: warningColor,
                                          ),
                                          half: Icon(
                                            Icons.star_half_rounded,
                                            color: warningColor,
                                          ),
                                          empty: Icon(
                                            Icons.star_border_rounded,
                                            color: warningColor,
                                          ),
                                        ),
                                        onRatingUpdate: (rating) {
                                          // controller.rating = rating;
                                          // debugPrint(controller.rating.toString());
                                          
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      width: 100.w,
                                      height: 120,
                                      color: Colors.transparent,
                                      child: TextField(
                                        controller: controller.reviewC,
                                        style: projectTextTheme.bodyText2,
                                        minLines: 12,
                                        maxLines: 20,
                                        onChanged: (String newVal) {
                                          if(newVal.length <= controller.maxLength){
                                            controller.reviewResult.value = newVal;
                                          } else{
                                            controller.reviewC.text = controller.reviewResult.value;
                                          }
                                        },
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: slate300,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: slate300,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Write your feedback here...",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Obx(
                                        () => Text(
                                          "${controller.reviewResult.value.length}/200",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            color: slate500
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: 100.w,
                                      height: 60,
                                      decoration: shadowDecoration(),
                                      child: ElevatedButton(
                                        onPressed: () => controller.addFeedback(),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(primaryColor),
                                          overlayColor: MaterialStateProperty.all(primaryVariantColor),
                                          foregroundColor: MaterialStateProperty.all(onPrimaryColor),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          )),
                                        ),
                                        child: Text(
                                          "Send",
                                          style: projectTextTheme.button,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: 100.w,
                                      height: 60,
                                      decoration: shadowDecoration(),
                                      child: OutlinedButton(
                                        onPressed: () => Get.back(),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(backgroundColor),
                                          overlayColor: MaterialStateProperty.all(surfaceColor),
                                          foregroundColor: MaterialStateProperty.all(secondaryColor),
                                          side: MaterialStateProperty.all(
                                              BorderSide(color: secondaryColor)),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          )),
                                        ),
                                        child: Text(
                                          "Cancel",
                                          style: projectTextTheme.button,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              )
                            ),
                          ),
                          SettingWidgets(
                            leading : IconlyBold.infoCircle,
                            title : "About",
                            onTap: () => Get.toNamed(Routes.ABOUT),
                          ),
                          SettingWidgets(
                            leading : IconlyBold.logout,
                            title : "Logout",
                            onTap: () => controller.logout(),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}


