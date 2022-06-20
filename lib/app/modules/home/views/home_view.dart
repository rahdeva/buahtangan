import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: shadowDecoration(),
              margin: const EdgeInsets.all(25.0),
              child: Center(
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: backgroundColor,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: backgroundColor,
                    child: Image.asset("assets/images/imagesLogo.png"),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [dropShadow()],
                borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.all(24.0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Image.asset(
                "assets/images/textLogo.png",
                width: Get.width * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
