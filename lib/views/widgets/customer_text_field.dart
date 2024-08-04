import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  const CustomerTextField({
    super.key,
    required this.title,
    required this.maxLines,
  });
  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
