import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/helpers/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.initializedNavBar(bindings: AppPages.NAV_PAGE_BINDINGS);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // if (kDebugMode) {
  //   runApp(
  //     DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => MyApp(),
  //     ),
  //   );
  // } else {
  //   runApp(MyApp());
  // }
  runApp(MyApp());
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
          return RefreshConfiguration(
            headerBuilder: () => MaterialClassicHeader(
              color: primaryColor,
            ),
            headerTriggerDistance: 80.0,
            springDescription: const SpringDescription(
              stiffness: 170, 
              damping: 16, 
              mass: 1.9
            ),
            maxOverScrollExtent : 100, 
            maxUnderScrollExtent: 0,
            enableScrollWhenRefreshCompleted: true,
            enableLoadingWhenFailed : true,
            hideFooterWhenNotFull: false,
            enableBallisticLoad: true, 
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "BuahTangan",
              initialRoute: snap.data != null ? Routes.DASHBOARD : AppPages.INITIAL,
              getPages: AppPages.routes,
              locale: const Locale('id', 'ID'),
              fallbackLocale: const Locale('id', 'ID'),
              builder: (BuildContext context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ?? Container(),
                );
              },
            ),
          );
        });
      }
    );
  }
}
