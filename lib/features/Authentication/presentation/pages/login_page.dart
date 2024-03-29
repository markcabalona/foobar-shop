// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:foobar_shop/core/constants/grid.dart';
import 'package:foobar_shop/core/constants/spacers.dart';
import 'package:foobar_shop/core/dependencies/dependencies.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:foobar_shop/core/utils/validators/email.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/auth_inputs_cubit_cubit.dart';
import 'package:foobar_shop/features/Authentication/presentation/cubit/authentication_cubit.dart';
import 'package:foobar_shop/features/Authentication/presentation/widgets/generic_field.dart';
import 'package:foobar_shop/features/Authentication/presentation/widgets/password_field.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomGrid.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacers.x4Large,
              Align(
                alignment: Alignment.center,
                child: FlutterLogo(
                  curve: Curves.easeIn,
                  duration: 1000.ms,
                  size: 180,
                  style: FlutterLogoStyle.stacked,
                  textColor: Theme.of(context).colorScheme.primary,
                ),
              ).animate().slideY(begin: .5, duration: 1500.ms).fadeIn(),
              VerticalSpacers.medium,
              Row(
                children: [
                  const Expanded(child: Divider()),
                  HorizontalSpacers.small,
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.displaySmall,
                  ).animate().slideX(begin: -1, duration: 1500.ms).fadeIn(),
                ],
              ),
              VerticalSpacers.large,
              GenericField(
                initialValue:
                    serviceLocator<AuthInputsCubit>().state.loginInputs.email,
                validator: validateEmail,
                hintText: 'Email',
                onChanged: (value) {
                  serviceLocator<AuthInputsCubit>().updateLoginInputs(
                    email: value,
                  );
                },
              ).animate(delay: 400.ms).slideX(begin: -.5).fadeIn(),
              VerticalSpacers.medium,
              PasswordField(
                initialValue: serviceLocator<AuthInputsCubit>()
                    .state
                    .loginInputs
                    .password,
                onChanged: (value) {
                  serviceLocator<AuthInputsCubit>().updateLoginInputs(
                    password: value,
                  );
                },
              ).animate(delay: 600.ms).slideX(begin: -.5).fadeIn(),
              VerticalSpacers.medium,
              TextButton(
                onPressed: () {
                  final inputs = serviceLocator<AuthInputsCubit>().state;
                  serviceLocator<AuthenticationCubit>().login(
                    email: inputs.loginInputs.email!,
                    password: inputs.loginInputs.password!,
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              ).animate(delay: 800.ms).slideX(begin: -.5).fadeIn(),
              VerticalSpacers.medium,
              Row(
                children: [
                  Text.rich(TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account yet? ",
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(Routes.registration.name);
                          },
                      ),
                    ],
                  ))
                      .animate(delay: 1000.ms)
                      .slideX(
                        begin: -.5,
                      )
                      .fadeIn(),
                  HorizontalSpacers.small,
                  const Expanded(child: Divider()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
