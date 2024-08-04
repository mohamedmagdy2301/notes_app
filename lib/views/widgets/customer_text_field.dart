import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  const CustomerTextField({
    super.key,
    required this.title,
    required this.maxLines,
    this.onSaved,
  });
  final String title;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onSaved: onSaved,
    );
  }
}
