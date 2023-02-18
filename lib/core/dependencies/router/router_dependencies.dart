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
        return null;
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
