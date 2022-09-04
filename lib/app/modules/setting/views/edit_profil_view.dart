import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>?>(
              future: controller.getProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: Get.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.data == null) {
                  return SizedBox(
                    height: Get.height,
                    child: const Center(
                      child: Text("Tidak ada data user."),
                    ),
                  );
                } else {
                  controller.emailC.text = snapshot.data!["email"];
                  controller.nameC.text = snapshot.data!["name"];
                  controller.phoneC.text = snapshot.data!["phone"];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const BackButtonWidget(),
                      Container(
                        width: Get.width,
                        height: Get.height - 100,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: [dropShadow()],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                            child: Text(
                              "Edit Profile",
                              style: projectTextTheme.headline6
                                  ?.copyWith(color: onBackgroundColor),
                            ),
                          ),
                          // Email TextField
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            decoration: BoxDecoration(
                              boxShadow: [dropShadow()],
                            ),
                            child: TextField(
                              readOnly: true,
                              style: projectTextTheme.subtitle1,
                              controller: controller.emailC,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              decoration: InputDecoration(
                                labelText: "Email",
                                filled: true,
                                fillColor: slate300,
                                isDense: true,
                                contentPadding: const EdgeInsets.all(22),
                                labelStyle: projectTextTheme.subtitle1
                                    ?.copyWith(color: onSurfaceColor),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          // Name TextField
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            decoration: BoxDecoration(
                              boxShadow: [dropShadow()],
                            ),
                            child: TextField(
                              style: projectTextTheme.subtitle1,
                              controller: controller.nameC,
                              keyboardType: TextInputType.name,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  hintText: "Your Name...",
                                  hoverColor: surfaceColor,
                                  fillColor: surfaceColor,
                                  focusColor: primaryColor,
                                  isDense: true,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                  labelStyle: projectTextTheme.subtitle1
                                      ?.copyWith(color: onSurfaceColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 0.0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          // Phone TextField
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            decoration: BoxDecoration(
                              boxShadow: [dropShadow()],
                            ),
                            child: TextField(
                              style: projectTextTheme.subtitle1,
                              controller: controller.phoneC,
                              keyboardType: TextInputType.phone,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "Your Phone Number...",
                                  hoverColor: surfaceColor,
                                  fillColor: surfaceColor,
                                  focusColor: primaryColor,
                                  isDense: true,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                  labelStyle: projectTextTheme.subtitle1
                                      ?.copyWith(color: onSurfaceColor),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 0.0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                          // Update Profile Button
                          Container(
                            margin: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                            child: Container(
                              width: Get.width,
                              height: 60,
                              decoration: shadowDecoration(),
                              child: Obx(
                                () => ElevatedButton(
                                  onPressed: () {
                                    if (controller.isLoading.isFalse) {
                                      controller.updateProfile();
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        secondaryColor),
                                    overlayColor: MaterialStateProperty.all(
                                        secondaryVariantColor),
                                    foregroundColor: MaterialStateProperty.all(
                                        onSecondaryColor),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                                  ),
                                  child: Text(
                                    controller.isLoading.isFalse
                                        ? "Update Profile"
                                        : "Loading...",
                                    style: projectTextTheme.button,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  );
                }
              }),
        )));
  }
}

// GetBuilder<ProfileController>(
//                   builder: (c) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         c.image != null
//                             ? Column(
//                                 children: [
//                                   Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(100),
//                                       color: Colors.grey[400],
//                                       image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: FileImage(File(c.image!.path)),
//                                       ),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () => c.resetImage(),
//                                     child: Text("delete"),
//                                   ),
//                                 ],
//                               )
//                             : snapshot.data?["profile"] != null && c.profile.isTrue
//                                 ? Column(
//                                     children: [
//                                       Container(
//                                         width: 100,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(100),
//                                           color: Colors.grey[400],
//                                           image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(snapshot.data!["profile"]),
//                                           ),
//                                         ),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           Get.defaultDialog(
//                                             title: "Delete Profile",
//                                             middleText: "Apakah kamu yakin untuk menghapus foto profile ?",
//                                             actions: [
//                                               OutlinedButton(
//                                                 onPressed: () => Get.back(),
//                                                 child: Text("CANCEL"),
//                                               ),
//                                               ElevatedButton(
//                                                 onPressed: () => c.clearProfile(),
//                                                 child: Text("YES"),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                         child: Text("clear profile"),
//                                       ),
//                                     ],
//                                   )
//                                 : Text("Belum ada profile"),
//                         TextButton(
//                           onPressed: () => c.pickImage(),
//                           child: Text("choose"),
//                         ),