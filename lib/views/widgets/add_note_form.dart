import 'package:flutter/material.dart';
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
