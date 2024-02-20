import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:twitter/theme/pallete.dart';

class AuthInputWidget extends StatelessWidget {
  final String name;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;

  const AuthInputWidget({
    super.key,
    required this.name,
    required this.hintText,
    required this.validator,
    this.isPassword = false,
  });

  static OutlineInputBorder outline({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      obscureText: isPassword == true,
      enableSuggestions: isPassword != true,
      autocorrect: isPassword != true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 18),
        focusedBorder: outline(color: Pallete.blueColor),
        errorBorder: outline(color: Pallete.redColor),
        focusedErrorBorder: outline(color: Pallete.redColor),
        enabledBorder: outline(color: Pallete.greyColor),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      validator: validator,
    );
  }
}
