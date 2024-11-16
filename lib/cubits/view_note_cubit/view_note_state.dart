part of 'view_note_cubit.dart';

@immutable
sealed class ViewNoteState {}

final class ViewNoteInitial extends ViewNoteState {}

final class ViewEmptyNota extends ViewNoteState {}

final class ViewNoteSuccess extends ViewNoteState {}
