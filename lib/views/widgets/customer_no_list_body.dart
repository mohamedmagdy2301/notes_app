import 'package:flutter/material.dart';

class CustomerNoListBody extends StatelessWidget {
  const CustomerNoListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/sticky-note.png',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(.4),
        ),
        const SizedBox(height: 30),
        Text(
          'No Notes Yet...',
          style: TextStyle(
            color: Colors.grey.withOpacity(.5),
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        const SizedBox(height: 80),
      ],
    ));
  }
}
