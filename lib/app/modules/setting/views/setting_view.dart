import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:get/get.dart';

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
              Container(
                decoration: shadowDecoration(),
                margin: const EdgeInsets.all(25.0),
                child: const Center(
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage("https://source.unsplash.com/random/800x800?gift")
                    ),
                  ),
                ),
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
                    const SizedBox(height: 24),
                    SettingWidgets(
                      leading : const Icon(IconlyBold.edit),
                      title : Text("Edit Profile", style: projectTextTheme.bodyText1),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      route: Routes.EDIT_PROFIL,
                    ),
                    SettingWidgets(
                      leading : const Icon(IconlyBold.lock),
                      title : Text("Change Password", style: projectTextTheme.bodyText1),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      route: Routes.CHANGE_PASSWORD,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [dropShadow()],
                        color: surfaceColor
                      ),
                      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: Center(
                        child: ListTile(
                          onTap: () => Get.defaultDialog(title: "Halo"),
                          leading: const Icon(IconlyBold.message),
                          title: Text("Send Feedback", style: projectTextTheme.bodyText1),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          iconColor: onSurfaceColor,
                          textColor: onSurfaceColor,
                        ),
                      ),
                    ),
                    SettingWidgets(
                      leading : const Icon(IconlyBold.infoCircle),
                      title : Text("About", style: projectTextTheme.bodyText1),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      route: Routes.ABOUT,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [dropShadow()],
                        color: surfaceColor
                      ),
                      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: Center(
                        child: ListTile(
                          onTap: () => controller.logout(),
                          leading: const Icon(IconlyBold.logout),
                          title: Text("Logout", style: projectTextTheme.bodyText1),
                          iconColor: onSurfaceColor,
                          textColor: onSurfaceColor,
                        ),
                      ),
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

class SettingWidgets extends StatelessWidget {
  final Icon leading;
  final Text title;
  final Icon trailing;
  final String route;

  const SettingWidgets({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.route,
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [dropShadow()],
        color: surfaceColor
      ),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Center(
        child: ListTile(
          iconColor: onSurfaceColor,
          textColor: onSurfaceColor,
          onTap: ()=> Get.toNamed(route),
          leading: leading,
          title: title,
          trailing: trailing,
        ),
      ),
    );
  }
}
