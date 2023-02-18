import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart';
import 'package:foobar_shop/core/enums/state_status.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/core/theme/theme.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';
import 'package:foobar_shop/firebase_options.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.defaultCurve = Curves.ease;
  Animate.defaultDuration = 800.ms;
  Animate.restartOnHotReload = true;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      themeMode: ThemeMode.light,
      routerConfig: serviceLocator<GoRouter>(),
      builder: EasyLoading.init(
        builder: (context, child) {
          return FutureBuilder(
              future: FirebaseAuth.instance.authStateChanges().first,
              builder: (context, user) {
                if (user.hasData) {
                  final isAuthenticated = user.data != null;
                  final router = serviceLocator<GoRouter>();
                  final isAuthenticating = [
                    Routes.login.path,
                    Routes.registration.path
                  ].contains(router.location);
                  if (isAuthenticated && isAuthenticating) {
                    router.goNamed(Routes.home.name);
                  } else if (!isAuthenticated && !isAuthenticating) {
                    router.goNamed(Routes.login.name);
                  }
                }
                return BlocListener<AuthenticationCubit, AuthenticationState>(
                  bloc: serviceLocator(),
                  listener: (context, state) {
                    final isAuthenticated =
                        state.authStatus == AuthStatus.authenticated;
                    final router = serviceLocator<GoRouter>();
                    final isAuthenticating = [
                      Routes.login.path,
                      Routes.registration.path
                    ].contains(router.location);

                    if (isAuthenticated && isAuthenticating) {
                      router.goNamed(Routes.home.name);
                    } else if (!isAuthenticated && !isAuthenticating) {
                      router.goNamed(Routes.login.name);
                    }
                  },
                  child: child ?? const SizedBox(),
                );
              });
        },
      ),
    );
  }
}
