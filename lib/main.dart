import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/helpers/utils.dart';
// import '../app/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.initializedNavBar(bindings: AppPages.NAV_PAGE_BINDINGS);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );
    // runApp(MyApp());
  } else {
    runApp(MyApp());
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (_, snap){
        if(snap.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Sizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "BuahTangan",
            initialRoute: snap.data != null ? Routes.DASHBOARD :AppPages.INITIAL,
            getPages: AppPages.routes,
            locale: const Locale('id', 'ID'),
            fallbackLocale: const Locale('id', 'ID'),
            builder: (BuildContext context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child ?? Container(),
              );
            },
            // theme: AppTheme.light,
            // darkTheme: AppTheme.dark,
            // themeMode: ThemeMode.system,
          );
        });
      }
    );
  }
}
