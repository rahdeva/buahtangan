import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import '../../../themes/decoration.dart';
import '../../../widgets/text-field/text_field_widget.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../../widgets/logo-container/logo_image_container.dart';
import '../../../widgets/text-field/password_text_field_widget.dart';
import '../../../modules/authentication/widgets/login_google_widget.dart';
import '../../../modules/authentication/widgets/goto_register_widget.dart';
import '../../../modules/authentication/widgets/rememberme_forgotpass_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const LogoImageContainer(),
              Container(
                width: Get.width,
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 24),
                decoration: whiteContainerDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to BuahTangan!",
                      style: projectTextTheme.headline6,
                    ),
                    const SizedBox(height: 32),
                    TextFieldWidget(
                      controller: controller.emailC,
                      keyboardType: TextInputType.emailAddress,
                      labelText: "Email",
                      hintText: "Your Email..."
                    ),
                    const SizedBox(height: 24),
                    PasswordTextFieldWidget(
                      controller: controller.passwordC,
                      isHidden: controller.isHidden, 
                      labelText: "Password",
                      hintText: "Your Password...",
                    ),
                    const SizedBox(height: 16),
                    RememberMeForgotPass(
                      controller: controller
                    ),
                    const SizedBox(height: 8),
                    PrimaryButtonWidget(
                      buttonText: "Login",           
                      isLoading: controller.isLoading,
                      backgroundColor: primaryColor, 
                      overlayColor: primaryVariantColor, 
                      foregroundColor: onPrimaryColor, 
                      onPress: () {
                        if (controller.isLoading.isFalse) {
                          controller.loginEmail();
                        }
                      }, 
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "- Or Login With -", 
                      style: projectTextTheme.caption
                    ),
                    const SizedBox(height: 16),
                    LoginWithGoogleWidget(
                      controller: controller
                    ),
                    const SizedBox(height: 16),
                    const GotoRegisterText(),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}