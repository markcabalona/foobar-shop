// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/constants/spacers.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/enums/state_status.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:foobar_shop/features/Products/presentation/cubit/products_cubit.dart';

class ProductPages extends StatelessWidget {
  const ProductPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => serviceLocator(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state.status) {
            case StateStatus.initial:
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                serviceLocator<ProductsCubit>().fetchProducts();
              });
              return const SizedBox();
            case StateStatus.loaded:
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ProductsList(
                  products: state.products,
                ),
              );
            case StateStatus.loading:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator.adaptive(),
                    VerticalSpacers.large,
                    Text(
                      'Loading Products...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              );
            case StateStatus.error:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    VerticalSpacers.large,
                    Text(
                      'Loading Products...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomGrid.xSmall),
      child: Wrap(
        children: products
            .map(
              (e) => GestureDetector(
                onTap: () {
                  serviceLocator<AuthenticationCubit>().logout();
                },
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: (MediaQuery.of(context).size.width / 2) -
                        CustomGrid.xSmall,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: CustomGrid.xSmall),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          e.imagePath,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: CustomGrid.xSmall,
                            horizontal: CustomGrid.small,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text('PHP ${e.price}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
