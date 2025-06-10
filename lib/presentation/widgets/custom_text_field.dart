import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onSubmit;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final double? borderRadius;
  const CustomTextField({
    super.key,
    this.hintText,
    this.onSubmit,
    this.textInputType,
    this.textEditingController,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText ?? "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1
          )
        )
      ),
      onSubmitted: onSubmit,
    );
  }
}
