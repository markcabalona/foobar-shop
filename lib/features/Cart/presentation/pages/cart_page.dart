import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/constants/spacers.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: serviceLocator(),
      builder: (context, state) {
        if (state.products.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(CustomGrid.large),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 64,
                  ),
                  VerticalSpacers.large,
                  Text(
                    'You have no products in your cart.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          );
        }
        final groupedProducts = groupBy<Product, String>(
          state.products,
          (p0) => p0.id,
        ).entries.toList();

        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: groupedProducts.length,
              itemBuilder: (context, index) {
                final List<Product> products = groupedProducts[index].value;
                final int count = products.length;
                final Product product = products.first;
                final double amount = products.fold<double>(
                  0,
                  (previousValue, element) => previousValue + element.price,
                );
                return ListTile(
                  onTap: () {
                    context.pushNamed(
                      Routes.product.subname(Routes.cart.name),
                      extra: product,
                    );
                  },
                  leading: Image.network(
                    product.imagePath,
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                  title: Text('${product.name} (x$count)'),
                  subtitle: Text('Amount: PHP ${(amount).toStringAsFixed(2)}'),
                  trailing: IconButton(
                    onPressed: () {
                      serviceLocator<CartCubit>()
                          .removeFromCart(product: product);
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_cart_checkout_outlined),
                  HorizontalSpacers.small,
                  Text('Checkout'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
