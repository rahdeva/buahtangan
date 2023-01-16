import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/decoration.dart';

class LogoImageContainer extends StatelessWidget {
  const LogoImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowDecoration(),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: backgroundColor,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: backgroundColor,
            child: SvgPicture.asset("assets/images/imagesLogo.svg"),
          ),
        ),
      ),
    );
  }
}