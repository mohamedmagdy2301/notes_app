import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_list_body.dart';
import 'package:notes_app/views/widgets/floating_button_add_note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomerAppBar(titleAppBar: 'Notes', iconAppBar: Icons.search),
      body: CustomerListBody(),
      floatingActionButton: FloatingButtonAddNoteItem(),
    );
  }
}
