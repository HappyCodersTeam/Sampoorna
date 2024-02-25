// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sampoorna_app/src/constant.dart';
import 'package:sampoorna_app/src/screens/Authentication/authrepo.dart';
import 'package:sampoorna_app/src/screens/Onboarding/OnboardingPage.dart';

import 'package:sampoorna_app/src/theme/theme_provider.dart';

import 'firebase_options.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }
Future<void> main() async {

  final WidgetsBinding widgetsBinding =WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(authenticationRepository()));
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class AuthenticationRepository {
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider()..init(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
            return GetMaterialApp(
            debugShowCheckedModeBanner: false,
                theme: notifier.lightTheme, // Use lightTheme for light mode
                darkTheme: notifier.darkTheme, // Use darkTheme for dark mode
                themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
              home: OnboardingPage(),
                );
          }
        ),
      );
  }
}


