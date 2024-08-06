import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/customer_note_item.dart';

class CustomerListBody extends StatefulWidget {
  const CustomerListBody({super.key});

  @override
  State<CustomerListBody> createState() => _CustomerListBodyState();
}

class _CustomerListBodyState extends State<CustomerListBody> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<ViewNoteCubit>(context).getNote();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<ViewNoteCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return CustomerNoteItem(noteModel: notes[index]);
          },
        );
      },
    );
  }
}
