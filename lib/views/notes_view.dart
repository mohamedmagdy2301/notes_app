import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes/views/widgets/customer_appbar.dart';
import 'package:notes/views/widgets/customer_list_body.dart';
import 'package:notes/views/widgets/customer_no_list_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    var notesBlocProvider = BlocProvider.of<ViewNoteCubit>(context);

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
      body: BlocBuilder<ViewNoteCubit, ViewNoteState>(
        builder: (context, state) {
          if (state is ViewEmptyNota) {
            return const CustomerNoListBody();
          }
          return CustomerListBody(notes: notesBlocProvider.notes);
        },
      ),
    );
  }
}
