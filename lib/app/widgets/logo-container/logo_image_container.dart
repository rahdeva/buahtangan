// ignore_for_file: must_be_immutable

import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/decoration.dart';

class LogoImageContainer extends StatelessWidget {
  LogoImageContainer({
    this.backgroundRadius,
    this.logoRadius,
    super.key
  });

  double? backgroundRadius;
  double? logoRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowDecoration(),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Center(
        child: CircleAvatar(
          radius: backgroundRadius ?? 60,
          backgroundColor: backgroundColor,
          child: CircleAvatar(
            radius: logoRadius ?? 40,
            backgroundColor: backgroundColor,
            child: SvgPicture.asset("assets/images/imagesLogo.svg"),
          ),
        ),
      ),
    );
  }
}