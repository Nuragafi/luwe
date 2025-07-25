// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final double? radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final String? hintText;
  final Color? fillColor;
  final bool? readOnly;
  final List<TextInputFormatter>? textFormatter;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final int? maxLines;
  final bool? expands;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.width,
    this.obscureText,
    this.hintText,
    this.fillColor,
    this.radius,
    this.readOnly,
    this.textFormatter,
    this.onChanged,
    this.onSubmit,
    this.maxLines,
    this.expands,
    this.hintStyle,
    this.validator,
    this.horizontalPadding,
    this.verticalPadding,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        expands: expands ?? false,
        maxLines: maxLines,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 40,
            vertical: verticalPadding ?? 10,
          ),
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        keyboardType: keyboardType,
        inputFormatters: textFormatter,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        validator: validator,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
