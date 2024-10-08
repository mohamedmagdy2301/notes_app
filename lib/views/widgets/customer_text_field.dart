import 'package:flutter/material.dart';
import 'package:notes/helper/constant.dart';

class CustomerTextField extends StatelessWidget {
  const CustomerTextField({
    super.key,
    required this.title,
    required this.maxLines,
    this.onSaved,
    this.onChanged,
    required this.maxLength,
  });
  final String title;
  final int maxLines, maxLength;
  final void Function(String?)? onSaved, onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      onSaved: onSaved,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }
}
