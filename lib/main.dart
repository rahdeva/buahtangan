import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(
    StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snap){
        if(snap.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GetMaterialApp(
          title: "BuahTangan",
          initialRoute: snap.data != null ? Routes.HOME :AppPages.INITIAL,
          getPages: AppPages.routes,
          // theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          // themeMode: ThemeMode.system,
        );
      }
    ),
  );
}
