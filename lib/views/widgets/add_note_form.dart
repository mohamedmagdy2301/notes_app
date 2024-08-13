import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/customer_color_circle.dart';
import 'package:notes/views/widgets/customer_elevated_button_in_bottom_sheet.dart';
import 'package:notes/views/widgets/customer_text_field.dart';

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
            maxLength: 20,
          ),
          const SizedBox(height: 20),
          CustomerTextField(
            title: 'Content',
            maxLines: 3,
            onSaved: (value) {
              subTitle = value;
            },
            maxLength: 80,
          ),
          const CustomerColorList(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomerElevatedButtonInBottomSheet(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  addNoteModel(context);
                  BlocProvider.of<ViewNoteCubit>(context).getNote();
                },
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void addNoteModel(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var formattedDate = DateFormat.yMMMd().format(DateTime.now());
      var noteModel = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: formattedDate,
        color: BlocProvider.of<AddNoteCubit>(context).color.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
