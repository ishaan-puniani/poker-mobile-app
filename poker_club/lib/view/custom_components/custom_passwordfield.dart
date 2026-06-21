import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';

class CustomPasswordField extends StatefulWidget {
  final double? width;
  final double? height;
  final double radius;

  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  final Widget? prefixIcon;

  final String hint;
  final TextStyle? hintStyle;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onFieldSubmitted;

  const CustomPasswordField({
    super.key,
    this.width,
    this.height,
    this.radius = 12,
    required this.backgroundColor,
    this.borderColor = Colors.amber,
    this.focusedBorderColor = Colors.orange,
    this.prefixIcon,
    required this.hint,
    this.hintStyle,
    this.controller,
    this.validator,
    this.obscureText = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      // height: widget.height ?? 40.w,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.white,
        textInputAction: widget.textInputAction,
        style: const TextStyle(color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: widget.backgroundColor,
          hintText: widget.hint,
          hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: ColorPallete.borderyellow,
              size: 20.r,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16).r,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.borderColor, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}
