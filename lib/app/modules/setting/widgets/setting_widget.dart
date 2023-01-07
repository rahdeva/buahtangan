import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:flutter/material.dart';

class SettingWidgets extends StatelessWidget {
  const SettingWidgets({
    required this.leading,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  
  final String title;
  final Function() onTap;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [dropShadow()],
        color: surfaceColor
      ),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Center(
        child: ListTile(
          iconColor: onSurfaceColor,
          textColor: onSurfaceColor,
          onTap: onTap,
          leading: Icon(leading),
          title: Text(title, style: projectTextTheme.bodyText1),
          trailing: title != "Logout" 
            ? const Icon(Icons.arrow_forward_ios_rounded)
            : null,
        ),
      ),
    );
  }
}