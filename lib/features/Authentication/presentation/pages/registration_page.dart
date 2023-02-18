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

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    _handleBackButton();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomGrid.large),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacers.x4Large,
                    Row(
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                            .animate()
                            .slideX(begin: 1, duration: 1500.ms)
                            .fadeIn(),
                        HorizontalSpacers.small,
                        const Expanded(child: Divider()),
                      ],
                    ),
                    VerticalSpacers.large,
                    GenericField(
                      initialValue: serviceLocator<AuthInputsCubit>()
                          .state
                          .registrationInputs
                          .firstName,
                      hintText: 'First Name',
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        serviceLocator<AuthInputsCubit>()
                            .updateRegistrationInputs(
                          firstName: value,
                        );
                      },
                    ).animate(delay: 300.ms).slideX(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    GenericField(
                      initialValue: serviceLocator<AuthInputsCubit>()
                          .state
                          .registrationInputs
                          .lastName,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      hintText: 'Last Name',
                      onChanged: (value) {
                        serviceLocator<AuthInputsCubit>()
                            .updateRegistrationInputs(
                          lastName: value,
                        );
                      },
                    ).animate(delay: 400.ms).slideX(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    GenericField(
                      initialValue: serviceLocator<AuthInputsCubit>()
                          .state
                          .registrationInputs
                          .email,
                      hintText: 'Email',
                      validator: validateEmail,
                      onChanged: (value) {
                        serviceLocator<AuthInputsCubit>()
                            .updateRegistrationInputs(
                          email: value,
                        );
                      },
                    ).animate(delay: 500.ms).slideX(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    PasswordField(
                      initialValue: serviceLocator<AuthInputsCubit>()
                          .state
                          .registrationInputs
                          .password,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        serviceLocator<AuthInputsCubit>()
                            .updateRegistrationInputs(
                          password: value,
                        );
                      },
                    ).animate(delay: 600.ms).slideX(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    PasswordField(
                      initialValue: serviceLocator<AuthInputsCubit>()
                          .state
                          .registrationInputs
                          .passwordConfirmation,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value !=
                            serviceLocator<AuthInputsCubit>()
                                .state
                                .registrationInputs
                                .password) {
                          return "Password doesn't match.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        serviceLocator<AuthInputsCubit>()
                            .updateRegistrationInputs(
                          passwordConfirmation: value,
                        );
                      },
                    ).animate(delay: 800.ms).slideX(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final inputs =
                              serviceLocator<AuthInputsCubit>().state;
                          serviceLocator<AuthenticationCubit>().register(
                            email: inputs.registrationInputs.email!,
                            password: inputs.registrationInputs.password!,
                            firstName: inputs.registrationInputs.firstName!,
                            lastName: inputs.registrationInputs.lastName!,
                          );
                        }
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text("Register"),
                        ),
                      ),
                    ).animate(delay: 1000.ms).slideY(begin: .5).fadeIn(),
                    VerticalSpacers.medium,
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        HorizontalSpacers.small,
                        Text.rich(TextSpan(
                          children: [
                            const TextSpan(
                              text: "Already have an account? ",
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _handleBackButton();
                                },
                            ),
                          ],
                        )).animate(delay: 1200.ms).slideX(begin: .5).fadeIn(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBackButton() {
    final router = serviceLocator<GoRouter>();
    router.canPop() ? router.pop() : router.goNamed(Routes.login.name);
  }
}
