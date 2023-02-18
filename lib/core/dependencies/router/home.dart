// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';
import 'package:foobar_shop/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:foobar_shop/features/Cart/presentation/pages/cart_page.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:foobar_shop/features/Products/presentation/pages/product_page.dart';
import 'package:foobar_shop/features/Products/presentation/pages/products_page.dart';
import 'package:go_router/go_router.dart';

void init() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'home',
    () => ShellRoute(
      pageBuilder: (context, state, child) => MaterialPage(
        child: SafeArea(
          child: HomeScaffold(
            body: child,
          ),
        ),
      ),
      routes: [
        GoRoute(
          path: Routes.home.path,
          name: Routes.home.name,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProductsPage(),
          ),
          routes: [
            GoRoute(
              path: Routes.product.subpath,
              name: Routes.product.subname(Routes.home.name),
              pageBuilder: (context, state) => NoTransitionPage(
                child: ProductPage(
                  product: state.extra as Product,
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: Routes.cart.path,
          name: Routes.cart.name,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CartPage(),
          ),
        ),
      ],
    ),
  );
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController ctrl;
  bool showLeading = false;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(vsync: this, duration: 800.ms);
    selectedIndex = _selectedIndex();
    showLeading = shouldShowLeading();
  }

  int _selectedIndex() {
    final router = serviceLocator<GoRouter>();

    return router.location.contains(Routes.cart.path) ? 1 : 0;
  }

  bool shouldShowLeading() {
    return serviceLocator<GoRouter>().location.contains(Routes.product.path);
  }

  @override
  void didChangeDependencies() {
    ctrl.reset();
    ctrl.forward();
    setState(() {
      selectedIndex = _selectedIndex();
      showLeading = shouldShowLeading();
    });

    log(selectedIndex.toString());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FooBar Shop'),
        leading: showLeading
            ? IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              )
            : null,
        titleSpacing: showLeading ? 0 : null,
        actions: [
          GestureDetector(
            onTap: () {
              serviceLocator<AuthenticationCubit>().logout();
            },
            child: Row(
              children: const [
                Text('Logout'),
                Icon(Icons.logout_outlined),
              ],
            ),
          ),
        ],
      ),
      body: widget.body
          .animate(
            controller: ctrl,
          )
          .slideY(delay: 200.ms, begin: .25)
          .fadeIn(delay: 200.ms),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              context.goNamed(Routes.home.name);
              break;
            case 1:
              context.goNamed(Routes.cart.name);
              break;
            default:
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CartCubit, CartState>(
              bloc: serviceLocator(),
              builder: (context, state) {
                return Badge(
                  label: Text(state.products.length.toString()),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                );
              },
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
