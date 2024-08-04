import 'package:flutter/material.dart';
import 'package:notes_app/helper/constant.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';

class FloatingButtonAddNoteItem extends StatelessWidget {
  const FloatingButtonAddNoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            });
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
