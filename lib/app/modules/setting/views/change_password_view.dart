import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
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
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 60, 40, 28),
                      child: Text(
                        "Change Password",
                        style: projectTextTheme.headline6?.copyWith(
                          color: onBackgroundColor
                        ),
                      ),
                    ),
                    // Current Password TextField
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    //   decoration: BoxDecoration(
                    //     boxShadow: [dropShadow()],
                    //   ),
                    //   child: Obx(
                    //     () => TextField(
                    //       style: projectTextTheme.subtitle1,
                    //       controller: controller.passNewC,
                    //       keyboardType: TextInputType.visiblePassword,
                    //       obscureText: controller.isHidden1.value,
                    //       autocorrect: false,
                    //       decoration: InputDecoration(
                    //         labelText: "New Password",
                    //         hintText: "New Password...",
                    //         hoverColor: surfaceColor,
                    //         fillColor: surfaceColor,
                    //         focusColor: primaryColor,
                    //         isDense: true,
                    //         filled: true,
                    //         suffixIcon: IconButton(
                    //           onPressed: () => controller.isHidden1.toggle(), 
                    //           icon: Icon(
                    //             controller.isHidden1.isTrue ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
                    //             color: primaryColor,
                    //           )
                    //         ),
                    //         contentPadding: const EdgeInsets.all(20), 
                    //         labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //           borderSide: BorderSide(color: primaryColor, width: 0.0)
                    //         ),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //           borderSide: BorderSide(color: surfaceColor, width: 0.0)
                    //         )
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Password TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: Obx(
                        () => TextField(
                          style: projectTextTheme.subtitle1,
                          controller: controller.passNewC,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isHidden1.value,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            hintText: "New Password...",
                            hoverColor: surfaceColor,
                            fillColor: surfaceColor,
                            focusColor: primaryColor,
                            isDense: true,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () => controller.isHidden1.toggle(), 
                              icon: Icon(
                                controller.isHidden1.isTrue ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
                                color: primaryColor,
                              )
                            ),
                            contentPadding: const EdgeInsets.all(20), 
                            labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: primaryColor, width: 0.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: surfaceColor, width: 0.0)
                            )
                          ),
                        ),
                      ),
                    ),
                    // Confirm Password TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: Obx(
                        () => TextField(
                          style: projectTextTheme.subtitle1,
                          controller: controller.passConfirmC,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isHidden2.value,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Confirm Password...",
                            hoverColor: surfaceColor,
                            fillColor: surfaceColor,
                            focusColor: primaryColor,
                            isDense: true,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () => controller.isHidden2.toggle(), 
                              icon: Icon(
                                controller.isHidden2.isTrue ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
                                color: primaryColor,
                              )
                            ),
                            contentPadding: const EdgeInsets.all(20), 
                            labelStyle: projectTextTheme.subtitle1?.copyWith(color: onSurfaceColor),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: primaryColor, width: 0.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: surfaceColor, width: 0.0)
                            )
                          ),
                        ),
                      ),
                    ),
                    // Register Button
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
                                controller.updatePassword();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(secondaryColor),
                              overlayColor: MaterialStateProperty.all(secondaryVariantColor),
                              foregroundColor: MaterialStateProperty.all(onSecondaryColor),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )
                              ),
                            ),
                            child: Text(
                              controller.isLoading.isFalse ? "Update Password" : "Loading...",
                              style: projectTextTheme.button,
                            ),
                          ),
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