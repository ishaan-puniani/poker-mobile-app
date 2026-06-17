import 'package:flutter/material.dart';
import 'package:poker_club/resources/color_pallete.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final bool readOnly;

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
  final TextInputAction? textInputAction;
  final void Function(String?)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.radius = 12,
    this.padding,
    this.readOnly = false,

    required this.backgroundColor,
    this.borderColor = Colors.amber,
    this.focusedBorderColor = Colors.orange,

    this.prefixIcon,
    this.suffixIcon,

    required this.hint,
    this.hintStyle,
    this.label,

    this.controller,
    this.validator,

    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: height ?? 40,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        textInputAction: textInputAction,
        style: const TextStyle(color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: backgroundColor,
          labelText: label,
          labelStyle: TextStyle(color: ColorPallete.yellow),
          floatingLabelBehavior: label != null
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,

          hintText: hint,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 16),

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
