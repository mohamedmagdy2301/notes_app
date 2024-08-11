import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/views/widgets/add_note_bottom_sheet.dart';

class FloatingButtonAddNoteItem extends StatelessWidget {
  const FloatingButtonAddNoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
