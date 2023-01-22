import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/decoration.dart';
import 'package:sizer/sizer.dart';

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
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 12),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: SvgPicture.asset(
        "assets/images/textLogo.svg",
        width: 40.w,
      ),
    );
  }
}