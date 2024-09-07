import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  bool isPassword;
  TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  CustomTextFormField({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    required this.validator,
    this.keyboardType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle the state
                  });
                },
              )
            : null, // Show eye icon only for password fields
      ),
    );
  }
}
