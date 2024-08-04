import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomerAppBar(titleAppBar: 'Edit Note', iconAppBar: Icons.done),
      body: Center(
        child: Text('Edit Note View'),
      ),
    );
  }
}
