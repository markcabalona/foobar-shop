import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/features/Products/presentation/cubit/products_cubit.dart';

void init() {
  serviceLocator.registerLazySingleton<ProductsCubit>(
    () => ProductsCubit(),
  );
}
