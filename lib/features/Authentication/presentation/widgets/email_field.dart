// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foobar_shop/core/utils/validators/email.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
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
        return validateEmail(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      decoration: const InputDecoration(
        hintText: 'Email',
        label: Text('Email'),
      ),
    );
  }
}
