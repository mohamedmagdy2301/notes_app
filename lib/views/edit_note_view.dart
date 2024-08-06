import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        titleAppBar: 'Edit Note',
        iconAppBar: Icons.done,
        onTap: () {
          widget.noteModel.title = title ?? widget.noteModel.title;
          widget.noteModel.subTitle = subTitle ?? widget.noteModel.subTitle;
          widget.noteModel.save();
          BlocProvider.of<ViewNoteCubit>(context).getNote();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Note updated successfully ✅'),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            CustomerTextField(
              title: widget.noteModel.title,
              maxLines: 1,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 20),
            CustomerTextField(
              title: widget.noteModel.subTitle,
              maxLines: 5,
              onChanged: (value) {
                subTitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
