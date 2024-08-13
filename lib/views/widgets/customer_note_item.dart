import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/customer_menu_icon_button_widget.dart';

class CustomerNoteItem extends StatelessWidget {
  const CustomerNoteItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    var notesBlocProvider = BlocProvider.of<ViewNoteCubit>(context);

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 8),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(noteModel.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      noteModel.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        noteModel.subTitle,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomerPopupMenuButtonWidget(
                  noteModel: noteModel, notesBlocProvider: notesBlocProvider),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              noteModel.date,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
