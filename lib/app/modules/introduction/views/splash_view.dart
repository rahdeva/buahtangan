import 'package:buahtangan/app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.ONBOARDING);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/imagesLogo.svg',
              width: Get.width * 0.6,
            ),
            const SizedBox(height: 16),
            SvgPicture.asset(
              'assets/images/textLogo.svg',
              width: Get.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

