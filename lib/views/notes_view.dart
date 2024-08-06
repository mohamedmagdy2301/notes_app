import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_list_body.dart';
import 'package:notes_app/views/widgets/floating_button_add_note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    var notesBlocProvider = BlocProvider.of<ViewNoteCubit>(context);
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: const FloatingButtonAddNoteItem(),
          appBar: CustomerAppBar(
            titleAppBar: 'Notes',
            iconAppBar: Icons.delete,
            onTap: () {
              notesBlocProvider.notes = [];
              notesBlocProvider.getNote();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All notes deleted successfully ✅'),
                ),
              );
            },
          ),
          body: CustomerListBody(notes: notesBlocProvider.notes ?? []),
        );
      },
    );
  }
}
