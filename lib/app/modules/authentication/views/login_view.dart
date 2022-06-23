import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read("rememberme") != null) {
      controller.emailC.text = box.read("rememberme")["email"];
      controller.passwordC.text = box.read("rememberme")["pass"];
      controller.rememberme.value = true;
    }
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
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: backgroundColor,
                      child: Image.asset("assets/images/imagesLogo.png"),
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [dropShadow()],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), 
                    topRight: Radius.circular(30), 
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 8),
                      child: Text(
                        "Welcome to BuahTangan!",
                        style: projectTextTheme.headline6,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
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
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: Obx(
                        () => TextField(
                          style: projectTextTheme.subtitle1,
                          controller: controller.passwordC,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isHidden.value,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Your Password...",
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
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller.rememberme.value,
                                  onChanged: (_) => controller.rememberme.toggle(),
                                ),
                                Text(
                                  "Remember me", 
                                  style: projectTextTheme.caption?.copyWith(
                                    color: slate500
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => controller.resetDialog(),
                            child: Text(
                              "forgot password?",
                              textAlign: TextAlign.start,
                              style: projectTextTheme.overline?.copyWith(
                                color: slate500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Login Button
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                      width: Get.width,
                      height: 60,
                      decoration: shadowDecoration(),
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            if (controller.isLoading.isFalse) {
                              controller.login();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(primaryColor),
                            overlayColor: MaterialStateProperty.all(primaryVariantColor),
                            foregroundColor: MaterialStateProperty.all(onPrimaryColor),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                            ),
                          ),
                          child: Text(
                            controller.isLoading.isFalse ? "Login" : "Loading...",
                            style: projectTextTheme.button,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                      child: Text("- Or Login With -", style: projectTextTheme.caption),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage("https://source.unsplash.com/random/80x80?google"),
                            ),
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            onTap: (){},
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage("https://source.unsplash.com/random/80x80?google"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn’t have any account yet?", style: projectTextTheme.bodyText2),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTER), 
                            child: Text(
                              "Register!", 
                              style: projectTextTheme.bodyText2?.copyWith(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          )
                        ],
                      ),
                    ),
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