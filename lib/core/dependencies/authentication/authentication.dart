import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/features/Authentication/presentation/cubit/auth_inputs_cubit_cubit.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';

void init() {
  serviceLocator.registerLazySingleton<AuthenticationCubit>(
    () => AuthenticationCubit(),
  );
  serviceLocator.registerLazySingleton<AuthInputsCubit>(
    () => AuthInputsCubit(),
  );
}
