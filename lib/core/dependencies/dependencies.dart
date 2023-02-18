import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foobar_shop/core/dependencies/authentication/authentication.dart'
    as auth;
import 'package:foobar_shop/core/dependencies/router/router_dependencies.dart'
    as router;
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

/// ## Registers app dependencies
///
/// - Singletons
/// ```
/// GetIt.instance<FlutterSecureStorage>() // FlutterSecureStorage()
///
/// // TODO: Register more singletons
/// ```
/// - Factories
///
/// ```
/// // TODO: Register factories
/// ```
///
/// You can also use `serviceLocator` instead of `GetIt.instance`
Future<void> initializeDependencies() async {
  registerSecureStorage();

  router.init();
  auth.init();
}

/// Registers a Flutter Secure Storage singleton
void registerSecureStorage() {
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions.defaultOptions,
    ),
  );
}
