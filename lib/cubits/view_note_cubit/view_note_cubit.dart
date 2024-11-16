// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/models/note_model.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
  List<NoteModel> notes = [];
  getNote() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
    if (notes.isNotEmpty) {
      emit(ViewNoteSuccess());
    } else {
      emit(ViewEmptyNota());
    }
  }

  deleteAllNotes() {
    Hive.box<NoteModel>(kNoteBox).deleteAll(notes.map((e) => e.key).toList());
    getNote();
  }
}
