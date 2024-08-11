import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/helper/constant.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_list_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    var notesBlocProvider = BlocProvider.of<ViewNoteCubit>(context);

    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return BlocProvider<AddNoteCubit>(
                      create: (context) => AddNoteCubit(),
                      child: const AddNoteBottomSheet(),
                    );
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
          appBar: CustomerAppBar(
            titleAppBar: 'Notes',
            iconAppBar: Icons.delete,
            onTap: () => messageForDelete(
              context,
              notesBlocProvider,
              "all notes",
              () {
                notesBlocProvider.deleteAllNotes();
                Navigator.pop(context);
              },
            ),
          ),
          body: CustomerListBody(notes: notesBlocProvider.notes ?? []),
        );
      },
    );
  }
}
