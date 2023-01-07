import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/text_theme.dart';
import '../../themes/color_theme.dart';
import '../../themes/decoration.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key? key,
    required this.isLoading,
    required this.onPress, 
    required this.backgroundColor, 
    required this.overlayColor, 
    required this.foregroundColor, 
    required this.buttonText,
  }) : super(key: key);

  final RxBool isLoading;
  final Function() onPress;
  final Color backgroundColor;
  final Color overlayColor;
  final Color foregroundColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      decoration: shadowDecoration(),
      child: Obx(
        () => ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            overlayColor: MaterialStateProperty.all(overlayColor),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )
            ),
          ),
          child: isLoading.isFalse 
            ? Text(
                buttonText,
                style: projectTextTheme.button,
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: surfaceColor,
                  backgroundColor: slate500,
                ),
              )
        ),
      ),
    );
  }
}