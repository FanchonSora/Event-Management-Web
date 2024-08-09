import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscure;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255)),
          decoration:  InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Color.fromRGBO(165, 165, 165, 0.773)),
            filled: true,
            fillColor: const Color.fromARGB(41, 9, 30, 51),
            floatingLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 123, 199, 250),
                fontSize: 16),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 1.0,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(20.0)),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 12, 158, 255),
                  width: 1.0,
                )),
          ),
          obscureText: obscure,
      ),
    );
  }
}