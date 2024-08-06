import 'package:flutter/material.dart';
import 'package:notes_app/helper/constant.dart';

class CustomerElevatedButtonInBottomSheet extends StatelessWidget {
  const CustomerElevatedButtonInBottomSheet({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });
  final Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor,
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : const Text(
                'Add Note',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
