import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class EmptyGiftListWidget extends StatelessWidget {
  const EmptyGiftListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ic_empty_box.png"
        ),
        const SizedBox(width: 16),
        Text(
          "No gifts have been added yet",
          style: projectTextTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
            color: slate500,
          ),
        ),
      ],
    );
  }
}