import 'package:buahtangan/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "BuahTangan",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeMode.system,
    ),
  );
}
