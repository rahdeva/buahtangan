import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/decoration.dart';
import '../../../themes/text_theme.dart';
import '../../../widgets/button/back_button.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

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
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/img_gift_heading.png"
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: [dropShadow()],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: Column(
                            children: [
                              const SizedBox(height: 56),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                                child: Text(
                                  "BuahTangan is an application that allows users to get the gift finder according to user input, see the gift directory, read articles about the gift, and gift planner.",
                                  style: projectTextTheme.bodyText1?.copyWith(
                                    color: onSurfaceColor
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                height: 50,
                                width: 100.w,
                                color: secondaryColor,
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                                child: Text(
                                  "Copyright © A-Dev 2023",
                                  style: projectTextTheme.bodyText2?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: tertiaryVariantColor
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]
                          ),
                        ),
                        Container(
                          width: 100.w,
                          transform: Matrix4.translationValues(0, -16, 0),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: [dropShadow()],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            children: [
                              Text(
                                "About",
                                style: projectTextTheme.headline6?.copyWith(
                                  color: onBackgroundColor
                                ),
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
