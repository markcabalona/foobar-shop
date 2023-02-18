import 'package:flutter/material.dart';
import 'package:foobar_shop/core/routes/routes.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: TextButton(
          onPressed: () {
            context.canPop()
                ? context.pop()
                : context.goNamed(Routes.login.name);
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
