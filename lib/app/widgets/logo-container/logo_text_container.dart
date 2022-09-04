import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../themes/decoration.dart';

class LogoTextContainer extends StatelessWidget {
  const LogoTextContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [dropShadow()],
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: SvgPicture.asset(
        "assets/images/textLogo.svg",
        width: Get.width * 0.5,
      ),
    );
  }
}