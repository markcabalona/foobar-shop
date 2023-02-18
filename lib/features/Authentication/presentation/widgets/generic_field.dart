// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GenericField extends StatelessWidget {
  const GenericField({
    Key? key,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String? initialValue;
  final TextCapitalization textCapitalization;
  final String? hintText;
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
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(hintText ?? ''),
      ),
    );
  }
}
