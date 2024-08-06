import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_body_edit_view.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        titleAppBar: 'Edit Note',
        iconAppBar: Icons.done,
        onTap: () {},
      ),
      body: const CutomerBodyEditView(),
    );
  }
}
