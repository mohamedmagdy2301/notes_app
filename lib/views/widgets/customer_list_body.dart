import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_note_item.dart';

class CustomerListBody extends StatelessWidget {
  const CustomerListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomerNoteItem(
          colorNoteItem: Color.fromARGB(255, 253, 204, 114),
          titleNoteItem: 'Note Title',
          subtitleNoteItem: 'Note Desstion here ,and more ...',
          timeNoteItem: 'May 12, 2022',
        );
      },
    );
  }
}
