
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/dependencies/router/auth.dart' as auth;
import 'package:foobar_shop/core/dependencies/router/home.dart' as home;
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

void init() {
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: Routes.login.path,
      redirect: (context, state) {
        final isAuthenticating = [Routes.login.path, Routes.registration.path]
            .contains(state.location);
        final isAuthenticated = FirebaseAuth.instance.currentUser != null;
        if (isAuthenticated) {
          if (!isAuthenticating) {
            return null;
          }
          return Routes.home.path;
        } else {
          if (isAuthenticating) {
            return null;
          }
          return Routes.login.path;
        }
      },
      routes: [
        serviceLocator<RouteBase>(instanceName: 'auth'),
        serviceLocator<RouteBase>(instanceName: 'home'),
      ],
    ),
  );
  auth.init();
  home.init();
}
