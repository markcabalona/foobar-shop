import 'package:flutter/material.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // serviceLocator<CartCubit>().addToCart(product: product);
        context.pushNamed(
          Routes.product.subname(Routes.home.name),
          extra: product,
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: (MediaQuery.of(context).size.width / 2) - CustomGrid.xSmall,
        ),
        padding: const EdgeInsets.symmetric(horizontal: CustomGrid.xSmall),
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imagePath,
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
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text('PHP ${product.price}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
