import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/onboarding_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: Get.height * 0.6,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              onPageChanged: (index, reason) => controller.index.value = index,
            ),
            items: controller.data.map(
              (data) {
                return Column(
                  children: [
                    Lottie.asset(
                      data["image"],
                      width: Get.width
                    ),
                    const SizedBox(height: 24),
                    Text(
                      data["title"],
                      style: projectTextTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: surfaceColor
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      data["desc"],
                      style: projectTextTheme.subtitle1?.copyWith(
                        color: surfaceColor
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.data.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselC.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.index.value == entry.key
                          ? secondaryColor
                          : surfaceColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        width: Get.width,
        height: 60,
        decoration: shadowDecoration(),
        child: ElevatedButton(
          onPressed: () => Get.offAllNamed(Routes.LOGIN),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(secondaryColor),
            overlayColor: MaterialStateProperty.all(secondaryVariantColor),
            foregroundColor: MaterialStateProperty.all(onSecondaryColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
          ),
          child: Text(
            "Login",
            style: projectTextTheme.button,
          ),
        ),
      ),
    );
  }
}
