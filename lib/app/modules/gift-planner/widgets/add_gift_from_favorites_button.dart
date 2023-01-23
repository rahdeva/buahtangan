import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddGiftFromFavoritesButton extends StatelessWidget {
  const AddGiftFromFavoritesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: slate500,
          boxShadow: [dropShadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.add,
              color: surfaceColor
            ),
            const SizedBox(width: 8),
            Text(
              "Add gift from favorites",
              style: projectTextTheme.bodyText2!.copyWith(
                color: surfaceColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}