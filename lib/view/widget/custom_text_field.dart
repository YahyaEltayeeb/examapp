import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    super.key,
    this.validator,
    required this.hintText,
    required this.helperText,
    required this.labelText,
    this.keyboard,
    this.counterText,
    this.maxLength,
  });
  final int? maxLength;
  final TextInputType? keyboard;
  final String? counterText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String helperText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        counterText: counterText,
        labelText: labelText,
        helperText: helperText,
        hintText: hintText,
      ),
    );
  }
}
