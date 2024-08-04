import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
}
