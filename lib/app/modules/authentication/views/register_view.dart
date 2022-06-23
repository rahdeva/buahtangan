import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/back-button/back_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

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
                height: Get.height - 50,
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
                        "Create a new Account",
                        style: projectTextTheme.headline6?.copyWith(
                          color: onBackgroundColor
                        ),
                      ),
                    ),
                    // Name TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
                    // Email TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: TextField(
                        style: projectTextTheme.subtitle1,
                        controller: controller.emailC,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Your Email...",
                          hoverColor: surfaceColor,
                          fillColor: surfaceColor,
                          focusColor: primaryColor,
                          isDense: true,
                          filled: true,
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
                    // Phone TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
                    // Password TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: Obx(
                        () => TextField(
                          style: projectTextTheme.subtitle1,
                          controller: controller.passC,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isHidden2.value,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password...",
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
                    // Confirm Password TextField [TBA]
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: Obx(
                        () => TextField(
                          style: projectTextTheme.subtitle1,
                          controller: controller.passC2,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isHidden.value,
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
                              onPressed: () => controller.isHidden.toggle(), 
                              icon: Icon(
                                controller.isHidden.isTrue ? Icons.visibility_rounded : Icons.visibility_off_rounded, 
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
                      margin: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                      child: Container(
                        width: Get.width,
                        height: 60,
                        decoration: shadowDecoration(),
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              if (controller.isLoading.isFalse) {
                                controller.register();
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
                              controller.isLoading.isFalse ? "Register" : "Loading...",
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
