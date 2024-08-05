import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/customer_elevated_button_in_bottom_sheet.dart';
import 'package:notes_app/views/widgets/customer_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomerTextField(
            title: 'Title',
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomerTextField(
              title: 'Content',
              maxLines: 5,
              onSaved: (value) {
                subTitle = value;
              }),
          const SizedBox(height: 40),
          CustomerElevatedButtonInBottomSheet(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: DateTime.now().toString(),
                  coloe: 0,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Note added successfully ✅'),
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
