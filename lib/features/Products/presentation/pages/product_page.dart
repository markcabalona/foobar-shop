// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/constants/spacers.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart';
import 'package:foobar_shop/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                product.imagePath,
                fit: BoxFit.fitWidth,
                height: 250,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(context).colorScheme.background,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: CustomGrid.small,
                  vertical: CustomGrid.small,
                ),
                width: double.infinity,
                height: 250,
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Price: PHP ${product.price}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Theme.of(context).colorScheme.primary,
                        decorationColor: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
          VerticalSpacers.medium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomGrid.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                VerticalSpacers.small,
                Text(
                  'Product Description:',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 2),
                ),
                VerticalSpacers.xSmall,
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w200, letterSpacing: 1.25),
                ),
                VerticalSpacers.small,
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          serviceLocator<CartCubit>()
                              .addToCart(product: product);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add_shopping_cart_outlined),
                            HorizontalSpacers.small,
                            Text('Add to Cart'),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      bloc: serviceLocator(),
                      builder: (context, state) {
                        if (state.products.contains(product)) {
                          return Expanded(
                            child: Row(
                              children: [
                                HorizontalSpacers.medium,
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      serviceLocator<CartCubit>()
                                          .removeFromCart(product: product);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons
                                            .remove_shopping_cart_outlined),
                                        HorizontalSpacers.small,
                                        Text('Remove'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
                VerticalSpacers.small,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
