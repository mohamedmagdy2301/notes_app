import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/customer_appbar.dart';
import 'package:notes/views/widgets/customer_edit_view_color.dart';
import 'package:notes/views/widgets/customer_text_field.dart';

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
          if (title == null && subTitle == null) {
            widget.noteModel.save();
            BlocProvider.of<ViewNoteCubit>(context).getNote();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color.fromARGB(218, 255, 1, 1),
                duration: Duration(milliseconds: 2000),
                content: Text(
                  'No changes (title and content)',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              ),
            );
          } else {
            Navigator.pop(context);

            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  title: const Text('Edit Note'),
                  content:
                      const Text('Are you sure you want to edit this note?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        widget.noteModel.title =
                            title ?? widget.noteModel.title;
                        widget.noteModel.subTitle =
                            subTitle ?? widget.noteModel.subTitle;
                        widget.noteModel.save();
                        BlocProvider.of<ViewNoteCubit>(context).getNote();
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                  ],
                );
              },
            );
          }
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
              maxLength: 15,
            ),
            const SizedBox(height: 20),
            CustomerTextField(
              title: widget.noteModel.subTitle,
              maxLines: 3,
              onChanged: (value) {
                subTitle = value;
              },
              maxLength: 80,
            ),
            const SizedBox(height: 20),
            CustomerEditColorList(noteModel: widget.noteModel),
          ],
        ),
      ),
    );
  }
}
