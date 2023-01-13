import 'package:buahtangan/app/modules/setting/widgets/setting_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              //   stream: controller.streamProfile(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(
              //         child: CircleAvatar(
              //           radius: 80,
              //           backgroundColor: slate500,
              //         ),
              //       );
              //     }

              //     Map<String, dynamic>? data = snapshot.data!.data();

              //     return Column(
              //       children: [
              //         Container(
              //           decoration: shadowDecoration(),
              //           margin: const EdgeInsets.all(25.0),
              //           child: Center(
              //             child: Stack(
              //               children: [
              //                 CircleAvatar(
              //                   radius: 80,
              //                   backgroundImage: NetworkImage(
              //                     data?["profile"] != null 
              //                     ? data!["profile"] 
              //                     : "https://ui-avatars.com/api/?size=120&name=${data!["name"]}"
              //                   ),
              //                 ),
              //                 Positioned(
              //                   bottom: 0,
              //                   right: 10,
              //                   child: CircleAvatar(
              //                     backgroundColor: secondaryColor,
              //                     radius: 20,
              //                     child: IconButton(
              //                       onPressed: () => controller.pickImage(), 
              //                       icon: Icon(
              //                         Icons.edit,
              //                         color: onSecondaryColor,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         Text(
              //           data["name"], 
              //           style: projectTextTheme.headline6?.copyWith(
              //             color: onPrimaryColor
              //           ),
              //         ),
              //       ],
              //     );
              //   }
              // ),
              const SizedBox(height: 40),
              Container(
                width: Get.width,
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
                      onTap: () => Get.defaultDialog(title: "Halo"),
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
    );
  }
}


