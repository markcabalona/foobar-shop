import 'package:flutter/material.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/features/Authentication/presentation/pages/login_page.dart';
import 'package:foobar_shop/features/Authentication/presentation/pages/registration_page.dart';
import 'package:foobar_shop/features/Authentication/presentation/widgets/auth_scaffold.dart';
import 'package:go_router/go_router.dart';

void init() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'auth',
    () => ShellRoute(
      pageBuilder: (context, state, child) => MaterialPage(
        child: AuthScaffold(
          body: child,
        ),
      ),
      routes: [
        GoRoute(
          path: Routes.login.path,
          name: Routes.login.name,
          pageBuilder: (context, state) => const CustomTransitionPage(
            transitionsBuilder: _transitionBuilder,
            transitionDuration: Duration(milliseconds: 300),
            child: LoginPage(),
          ),
        ),
        GoRoute(
          path: Routes.registration.path,
          name: Routes.registration.name,
          pageBuilder: (context, state) => const CustomTransitionPage(
            transitionsBuilder: _transitionBuilder,
            transitionDuration: Duration(milliseconds: 300),
            child: RegistrationPage(),
          ),
        ),
      ],
    ),
  );
}

Widget _transitionBuilder(context, animation, secondaryAnimation, child) =>
    FadeTransition(
      opacity: CurveTween(
        curve: Curves.easeInOut,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurveTween(
            curve: Curves.easeInOut,
          ).animate(animation),
        ),
        child: child,
      ),
    );
