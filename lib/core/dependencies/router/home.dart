import 'package:flutter/material.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/features/Products/presentation/pages/products_pages.dart';
import 'package:go_router/go_router.dart';

void init() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'home',
    () => ShellRoute(
      pageBuilder: (context, state, child) => MaterialPage(
        child: SafeArea(
          child: Scaffold(
            body: child,
          ),
        ),
      ),
      routes: [
        GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            builder: (context, state) => const ProductPages()),
      ],
    ),
  );
}
