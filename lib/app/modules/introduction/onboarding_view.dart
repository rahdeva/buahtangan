import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({ Key? key }) : super(key: key);

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
            subtitle: "Don't know where to eat?\nWe'll suggest best restaurant\nfor you!",
            textButton: "Next",
            controller: controller
          ),
          OnboardingItems(
            image: "assets/images/onboarding-2.png",
            title: "Detail\nRestaurants", 
            subtitle: "You can see the detail\neach of the restaurants\n ",
            textButton: "Get Started",
            controller: controller
          ),
        ],
      ),
    );
  }
}

class OnboardingItems extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  String textButton;
  final PageController controller;

  OnboardingItems({Key? key, 
    required this.image, 
    required this.title,
    required this.subtitle,
    required this.textButton,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
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
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    onPrimary: Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () {},
                child: Text(
                  textButton,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                )
            ),
          ),
        ],
      ),
    );
  }
}
