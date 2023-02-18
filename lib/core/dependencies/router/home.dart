import 'package:flutter/widgets.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

void init() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'home',
    () => ShellRoute(
      routes: [
        GoRoute(
          path: Routes.home.path,
          name: Routes.home.name,
          builder: (context, state) => const Center(
            child: Text('Home'),
          ),
        ),
      ],
    ),
  );
}
