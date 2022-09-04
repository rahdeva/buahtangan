import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:flutter/material.dart';

BoxShadow dropShadow() {
  return BoxShadow(
    color: onSurfaceColor.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 20,
    offset: const Offset(0, 5), // changes position of shadow
  );
}

BoxDecoration shadowDecoration() {
  return BoxDecoration(
    boxShadow: [dropShadow()],
  );
}

BoxDecoration whiteContainerDecoration() {
  return BoxDecoration(
    color: backgroundColor,
    boxShadow: [dropShadow()],
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30), 
      topRight: Radius.circular(30), 
    )
  );
}
