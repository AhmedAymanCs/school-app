import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller,
   this.prefixIcon, this.label, this.keyboardType, this.obscureText=false, this.validator});
  final TextEditingController controller ;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? label;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(),
      label: label,
      ),
    );
  }
}