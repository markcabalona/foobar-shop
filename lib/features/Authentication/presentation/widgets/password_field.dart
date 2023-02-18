// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:foobar_shop/core/utils/validators/password.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String? initialValue;
  final TextInputAction textInputAction;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late final TextEditingController controller;
  bool isHidden = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.initialValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value);
        }
        return passwordValidator(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: 'Password',
        label: const Text('Password'),
        errorMaxLines: 4,
        suffix: GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: AnimatedSwitcher(
            duration: 300.ms,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: isHidden
                ? const Icon(
                    key: ValueKey(false),
                    Icons.visibility_off,
                  )
                : const Icon(
                    key: ValueKey(true),
                    Icons.visibility,
                  ),
          ),
        ),
      ),
    );
  }
}
