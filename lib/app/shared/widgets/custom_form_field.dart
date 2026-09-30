import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String placeholder;
  final Widget? trailingIcon;
  final TextEditingController controller;
  final bool obscureText;

  const new({
    super.key,
    this.placeholder = '',
    this.trailingIcon,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF7F9FB),
        contentPadding: const .symmetric(vertical: 16.0, horizontal: 8.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(8),
          borderSide: const BorderSide(width: 1, color: Color(0XFF6063EE)),
        ),
        enabledBorder: const OutlineInputBorder(borderSide: .none),
        hintText: placeholder,
        hintStyle: const TextStyle(color: Color(0xB3464554)),
        suffixIcon: trailingIcon,
      ),
    );
  }
}
