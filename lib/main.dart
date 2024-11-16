import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/cubits/view_note_cubit/view_note_cubit.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer/bolc_observer.dart';
import 'package:notes/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await Hive.initFlutter();
  Bloc.observer = SimpleBolcObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NoteApp());
  FlutterNativeSplash.remove();
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewNoteCubit>(
      create: (context) => ViewNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: const NotesView(),
      ),
    );
  }
}
