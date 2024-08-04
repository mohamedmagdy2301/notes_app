import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customer_text_field.dart';

class CutomerBodyEditView extends StatelessWidget {
  const CutomerBodyEditView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          CustomerTextField(title: 'Title', maxLines: 1),
          SizedBox(height: 20),
          CustomerTextField(title: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
