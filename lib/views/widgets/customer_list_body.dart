import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/customer_note_item.dart';

class CustomerListBody extends StatefulWidget {
  const CustomerListBody({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  State<CustomerListBody> createState() => _CustomerListBodyState();
}

class _CustomerListBodyState extends State<CustomerListBody> {
  @override
  void initState() {
    BlocProvider.of<ViewNoteCubit>(context).getNote();
    log(BlocProvider.of<ViewNoteCubit>(context).notes.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return CustomerNoteItem(noteModel: widget.notes[index]);
      },
    );
  }
}
