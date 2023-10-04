import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 158, 0, 145))),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 255, 102, 0), width: 1)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color.fromARGB(255, 201, 0, 134))
            : null);
  }
}
