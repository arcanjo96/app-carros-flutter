import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {

  String label;
  String hint;
  bool obscure;
  TextEditingController controller;
  TextInputType keyboardType;
  FormFieldValidator<String> validator;


  TextFormWidget(this.label, this.hint, this.obscure, this.controller,
  {this.keyboardType, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}
