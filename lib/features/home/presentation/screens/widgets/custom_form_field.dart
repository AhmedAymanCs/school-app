import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class TextformField extends StatelessWidget {
  const TextformField({super.key, this.text, this.prefixIcon, this.validator});
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ColorManager.secondaryColor),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.secondaryColor,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: text,
      ),
    );
  }
}
