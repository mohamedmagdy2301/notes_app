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
          width: 180,
          height: 180,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(.5),
        ),
        const SizedBox(height: 30),
        Text(
          'No Notes Yet...',
          style: TextStyle(
            color: Colors.grey.withOpacity(.5),
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 80),
      ],
    ));
  }
}
