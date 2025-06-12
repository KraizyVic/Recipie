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
  final VoidCallback onFocus;
  final ValueChanged<bool> onFocusChange;
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
    required this.onFocus,
    required this.onFocusChange,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget.onFocus();
      }else{
        widget.onFocusChange(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: widget.isGlassMorphic ? 10 : 0,sigmaY: widget.isGlassMorphic ? 10 : 0),
        child: Container(
          width: widget.width ?? double.maxFinite,
          height: widget.height ?? 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
            color: widget.isGlassMorphic ? Theme.of(context).colorScheme.tertiary.withAlpha(50) : Colors.transparent,
          ),
          child: TextField(
            controller: widget.textEditingController,
            focusNode: widget.focusNode ?? _focusNode,
            onTap: widget.onTap,
            obscureText: widget.isPassword ?? false,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "Search",
              filled: widget.isFilled,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                  width: 1
                )
              ),
            ),
            onSubmitted: widget.onSubmit,
          ),
        ),
      ),
    );
  }
}