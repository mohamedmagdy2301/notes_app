import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/views/widgets/customer_appbar.dart';
import 'package:notes_app/views/widgets/customer_list_body.dart';
import 'package:notes_app/views/widgets/floating_button_add_note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewNoteCubit(),
      child: Scaffold(
        floatingActionButton: const FloatingButtonAddNoteItem(),
        appBar: CustomerAppBar(
          titleAppBar: 'Notes',
          iconAppBar: Icons.search,
          onTap: () {},
        ),
        body: const CustomerListBody(),
      ),
    );
  }
}
