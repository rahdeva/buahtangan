import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import '../../../themes/decoration.dart';
import '../../../widgets/button/back_button.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../../widgets/text-field/password_text_field_widget.dart';
import '../../../widgets/text-field/text_field_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BackButtonWidget(),
            Container(
              width: 100.w,
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 60),
              decoration: whiteContainerDecoration(),
              child: Column(
                children: [
                  Text(
                    "Create a new Account",
                    style: projectTextTheme.headline6?.copyWith(
                      color: onBackgroundColor
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                    controller: controller.nameC,
                    keyboardType: TextInputType.name,
                    labelText: "Name",
                    hintText: "Your Name...",
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    controller: controller.emailC,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "Your Email..."
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    controller: controller.phoneC,
                    keyboardType: TextInputType.phone,
                    labelText: "Phone Number",
                    hintText: "Your Phone Number...",
                  ),
                  const SizedBox(height: 24),
                  PasswordTextFieldWidget(
                    controller: controller.passC,
                    isHidden: controller.isHidden, 
                    labelText: "Password",
                    hintText: "Password...",
                  ),
                  const SizedBox(height: 24),
                  PasswordTextFieldWidget(
                    controller: controller.passC2,
                    isHidden: controller.isHidden2, 
                    labelText: "Confirm Password",
                    hintText: "Confirm Password...",
                  ),
                  const SizedBox(height: 40),
                  PrimaryButtonWidget(
                    buttonText: "Register",           
                    isLoading: controller.isLoading,
                    backgroundColor: secondaryColor, 
                    overlayColor: secondaryVariantColor, 
                    foregroundColor: onSecondaryColor, 
                    onPress: () {
                      if (controller.isLoading.isFalse) { 
                        controller.register();
                      }
                    }, 
                  ),
                ]
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
