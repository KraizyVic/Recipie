import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final ValueChanged<String>? onSubmit;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final double? borderRadius;
  final bool? isPassword;
  final bool isFilled;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
  final bool isGlassMorphic;
  final VoidCallback onTap;
  const CustomTextField({
    super.key,
    this.hintText,
    this.onSubmit,
    this.textInputType,
    this.textEditingController,
    this.borderRadius,
    this.isPassword,
    this.isFilled = false,
    this.focusNode,
    this.width,
    this.height,
    this.isGlassMorphic = false,
    required this.onTap,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      onTap: widget.onTap,
      obscureText: widget.isPassword ?? false,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText ?? "Search",
        filled: true,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
      onSubmitted: widget.onSubmit,
    );
  }
}