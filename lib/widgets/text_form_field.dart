import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {

  String label;
  String hint;
  bool senha;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode proxFocus;

  AppTextFormField(this.label, this.hint, {this.senha = false, this.controller,
    this.validator, this.keyboardType, this.textInputAction, this.focusNode,
    this.proxFocus,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: senha,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String texto){
        if(proxFocus != null ){
          FocusScope.of(context).requestFocus(proxFocus);
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        )
      ),
    );
  }
}
