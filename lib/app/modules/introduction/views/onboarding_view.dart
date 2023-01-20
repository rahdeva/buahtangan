import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 100.h,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    onPageChanged: (index, reason) => controller.index.value = index,
                  ),
                  items: controller.data.map(
                    (data) {
                      return data["id"] == 2
                      ? Column(
                          children: [
                            const SizedBox(height: 32),
                            Lottie.asset(
                              data["image"],
                              width: 100.w * 0.8
                            ),
                            const SizedBox(height: 28),
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
                        )
                      : data["id"] == 4
                        ? Column(
                            children: [
                              const SizedBox(height: 60),
                              Lottie.asset(
                                data["image"],
                                width: 100.w * 0.6
                              ),
                              const SizedBox(height: 42),
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
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 24),
                              Lottie.asset(
                                data["image"],
                                width: 100.w * 0.75
                              ),
                              const SizedBox(height: 20),
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
                  () => Positioned(
                    bottom: 5.h,
                    width: 100.w,
                    child: Row(
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
                ),
              ],
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
              width: 100.w,
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
                  "Get Started",
                  style: projectTextTheme.button,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
