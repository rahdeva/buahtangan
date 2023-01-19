import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';
import '../../../themes/decoration.dart';
import '../../../widgets/text-field/text_field_widget.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../../widgets/logo-container/logo_image_container.dart';
import '../../../widgets/text-field/password_text_field_widget.dart';
import '../../../modules/authentication/widgets/goto_register_widget.dart';
import '../../../modules/authentication/widgets/rememberme_forgotpass_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoImageContainer(
                backgroundRadius: 80,
                logoRadius: 60,
              ),
              const SizedBox(height: 16),
              Container(
                width: 100.w,
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 24),
                constraints: BoxConstraints(minHeight: 70.h),
                decoration: whiteContainerDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(height: 8),
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
                    Container(
                      width: Get.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        boxShadow: [dropShadow()],
                      ),
                      child: ElevatedButton(
                        onPressed: () => controller.loginGoogle(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(backgroundColor),
                          overlayColor: MaterialStateProperty.all(surfaceColor),
                          foregroundColor: MaterialStateProperty.all(onBackgroundColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/google.svg",
                              width: 25,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Continue with Google",
                              style: projectTextTheme.button!.copyWith(
                                fontSize: 16,
                                color: onSurfaceColor
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    const SizedBox(height: 16),
                    const GotoRegisterText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}