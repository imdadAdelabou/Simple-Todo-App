import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLine;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
