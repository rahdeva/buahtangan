import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:get/get.dart';

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
                      margin: const EdgeInsets.only(top: 60, bottom: 16),
                      child: Text(
                        "Welcome to BuahTangan!",
                        style: projectTextTheme.headline6,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: TextField(
                        style: projectTextTheme.subtitle1,
                        controller: controller.emailC,
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
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      decoration: BoxDecoration(
                        boxShadow: [dropShadow()],
                      ),
                      child: TextField(
                        style: projectTextTheme.subtitle1,
                        controller: controller.emailC,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Your Password...",
                          hoverColor: surfaceColor,
                          fillColor: surfaceColor,
                          focusColor: primaryColor,
                          isDense: true,
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: (){}, 
                            icon: Icon(
                              Icons.visibility_off_rounded,
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

