import 'package:flutter/material.dart';

var primaryColor = const Color(0xFF034A64);
var primaryVariantColor = const Color(0xFF013142);
var secondaryColor = const Color(0xFFED6F6A);
var secondaryVariantColor = const Color(0xFFEE413F);
var tertiaryColor = const Color(0xFFA7D6EA);
var tertiaryVariantColor = const Color(0xFF61B9E9);
var backgroundColor = const Color(0xFFFAFAFA);
var surfaceColor = const Color(0xFFFFFFFF);
var errorColor = const Color(0xFFB00020);
var onPrimaryColor = const Color(0xFFFFFFFF);
var onSecondaryColor = const Color(0xFFFFFFFF);
var onTertiaryColor = const Color(0xFFFFFFFF);
var onBackgroundColor = const Color(0xFF1E293B);
var onSurfaceColor = const Color(0xFF334155);
var onErrorColor = const Color(0xFFFFFFFF);
var slate300 = const Color(0xFFCBD5E1);
var slate500 = const Color(0xFF64748B);

BoxShadow dropShadow() {
  return BoxShadow(
    color: onSurfaceColor.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 20,
    offset: const Offset(0, 5), // changes position of shadow
  );
}
