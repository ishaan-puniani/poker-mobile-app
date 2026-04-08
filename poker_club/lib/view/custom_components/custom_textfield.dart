import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;

  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String hint;
  final TextStyle? hintStyle;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.radius = 12,

    required this.backgroundColor,
    this.borderColor = Colors.amber,
    this.focusedBorderColor = Colors.orange,

    this.prefixIcon,
    this.suffixIcon,

    required this.hint,
    this.hintStyle,

    this.controller,
    this.validator,

    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),

        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,

          hintText: hint,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: 1.2),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.red),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}
