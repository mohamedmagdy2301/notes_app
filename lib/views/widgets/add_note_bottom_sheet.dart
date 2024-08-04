import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_elevated_button_in_bottom_sheet.dart';
import 'package:notes_app/views/widgets/customer_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomerTextField(title: 'Title', maxLines: 1),
            SizedBox(height: 20),
            CustomerTextField(title: 'Content', maxLines: 5),
            SizedBox(height: 40),
            CustomerElevatedButtonInBottomSheet(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
