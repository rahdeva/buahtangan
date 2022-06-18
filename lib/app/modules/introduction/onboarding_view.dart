import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          OnboardingItems(
              image: "assets/lottie/recommendation.json",
              title: "Restaurant\nRecommendation",
              subtitle:
                  "Don't know where to eat?\nWe'll suggest best restaurant\nfor you!",
              controller: controller),
          OnboardingItems(
              image: "assets/images/onboarding-2.png",
              title: "Detail\nRestaurants",
              subtitle: "You can see the detail\neach of the restaurants\n ",
              controller: controller),
        ],
      ),
    );
  }
}

class OnboardingItems extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  final PageController controller;

  OnboardingItems(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Lottie.asset(image),
        const SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 40),
        // Center(
        //   child: SmoothPageIndicator(
        //     controller: controller,
        //     count: 2,
        //     effect: const WormEffect(
        //       spacing: 16,
        //       dotColor: Colors.black54,
        //       activeDotColor: yellowColor,
        //     ),
        //     onDotClicked: (index) => controller.animateToPage(index,
        //         duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
        //   ),
        // ),
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 24),
          width: Get.width,
          height: 60,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                overlayColor: MaterialStateProperty.all(primaryVariantColor),
                foregroundColor: MaterialStateProperty.all(onPrimaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              onPressed: () => Get.offAllNamed(Routes.LOGIN),
              child: Text(
                "Login",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0),
              )),
        ),
      ],
    );
  }
}
