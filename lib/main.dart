import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart';
import 'package:foobar_shop/core/theme/theme.dart';
import 'package:foobar_shop/firebase_options.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.defaultCurve = Curves.ease;
  Animate.defaultDuration = 800.ms;
  Animate.restartOnHotReload = true;
  await Future.wait(
    [
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      initializeDependencies(),
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor:
            CustomTheme.lightTheme.primaryColor, //Notification bar color
        statusBarIconBrightness:
            Brightness.light, //Notification bar icons color
        systemNavigationBarColor:
            CustomTheme.lightTheme.primaryColor, //Bottom navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.light, //Bottom navigation bar icons color
        statusBarBrightness:
            Brightness.light // Dark == white status bar -- for IOS.
        ),
  );
  Firebase.initializeApp(
    name: 'foobar-shop',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FooBar - Shop',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      routerConfig: serviceLocator<GoRouter>(),
    );
  }
}
