import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/helper/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomerNoteItem extends StatelessWidget {
  const CustomerNoteItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    var notesBlocProvider = BlocProvider.of<ViewNoteCubit>(context);

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 8),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(noteModel.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    noteModel.title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      noteModel.subTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              PopupMenuButton(
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              noteModel.date,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
