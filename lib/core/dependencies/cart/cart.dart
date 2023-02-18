import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/features/Cart/presentation/cubit/cart_cubit.dart';

void init() {
  serviceLocator.registerLazySingleton<CartCubit>(
    () => CartCubit(),
  );
}
