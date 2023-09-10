import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        labelText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: fontColor,
            width: 2.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
