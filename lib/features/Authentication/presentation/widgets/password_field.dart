// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foobar_shop/core/utils/validators/password.dart';

class PasswordField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: initialValue,
    );
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return passwordValidator(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: textInputAction,
      decoration: const InputDecoration(
          hintText: 'Password', label: Text('Password'), errorMaxLines: 4),
    );
  }
}
