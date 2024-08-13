import 'package:flutter/material.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/edit_note_view.dart';

class CustomerPopupMenuButtonWidget extends StatelessWidget {
  const CustomerPopupMenuButtonWidget({
    super.key,
    required this.noteModel,
    required this.notesBlocProvider,
  });

  final NoteModel noteModel;
  final ViewNoteCubit notesBlocProvider;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: const BoxConstraints(
        maxHeight: 100,
        maxWidth: 100,
      ),
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const Text("Edit"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditNoteView(noteModel: noteModel);
                },
              ),
            );
          },
        ),
        PopupMenuItem(
          child: const Text("Delete"),
          onTap: () {
            messageForDelete(
              context,
              notesBlocProvider,
              "note",
              () {
                noteModel.delete();
                Navigator.pop(context);
                notesBlocProvider.getNote();
              },
            );
          },
        ),
      ],
    );
  }
}
