import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomerAppBar(),
    );
  }
}
