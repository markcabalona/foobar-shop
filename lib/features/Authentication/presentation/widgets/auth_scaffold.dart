// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart'
    show serviceLocator;
import 'package:foobar_shop/core/enums/state_status.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/core/utils/state_indicator.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/auth_inputs_cubit_cubit.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';
import 'package:go_router/go_router.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => serviceLocator(),
        ),
        BlocProvider<AuthInputsCubit>(
          create: (context) => serviceLocator(),
        ),
      ],
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        bloc: serviceLocator(),
        listener: (context, state) {
          switch (state.authStatus) {
            case AuthStatus.authenticating:
              showLoading(state.loadingMessage ?? 'Loading...');
              break;
            case AuthStatus.authenticated:
              showSuccess(state.loadingMessage ?? 'Authenticated');
              context.goNamed(Routes.home.name);
              break;
            case AuthStatus.unauthenticated:
              showError(state.errorMessage ?? 'Unauthenticated');
              break;
            default:
          }
          if (state.authStatus == AuthStatus.authenticating) {}
        },
        child: SafeArea(
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }
}
