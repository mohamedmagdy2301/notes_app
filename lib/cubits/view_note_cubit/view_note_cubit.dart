// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_note_state.dart';

class ViewNoteCubit extends Cubit<ViewNoteState> {
  ViewNoteCubit() : super(ViewNoteInitial());
}
