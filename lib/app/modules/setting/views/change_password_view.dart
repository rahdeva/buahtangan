import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../../widgets/text-field/password_text_field_widget.dart';

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
              decoration: whiteContainerDecoration(),
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
              child: Column(
                children: [
                  Text(
                    "Change Password",
                    style: projectTextTheme.headline6?.copyWith(
                      color: onBackgroundColor
                    ),
                  ),
                  const SizedBox(height: 40),
                  PasswordTextFieldWidget(
                    controller: controller.curentPassC,
                    isHidden: controller.isHidden1, 
                    labelText: "Current Password",
                    hintText: "Current Password...",
                  ),
                  const SizedBox(height: 24),
                  PasswordTextFieldWidget(
                    controller: controller.newPassC,
                    isHidden: controller.isHidden2, 
                    labelText: "New Password",
                    hintText: "New Password...",
                  ),
                  const SizedBox(height: 24),
                  PasswordTextFieldWidget(
                    controller: controller.confirmNewPassC,
                    isHidden: controller.isHidden3, 
                    labelText: "Confirm New Password",
                    hintText: "Confirm New Password...",
                  ),
                  const SizedBox(height: 60),
                  PrimaryButtonWidget(
                    buttonText: "Update Password",           
                    isLoading: controller.isLoading,
                    backgroundColor: secondaryColor, 
                    overlayColor: secondaryVariantColor, 
                    foregroundColor: onSecondaryColor, 
                    onPress: () {
                      if (controller.isLoading.isFalse) {
                        controller.updatePassword();
                      }
                    }, 
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