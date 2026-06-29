import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/modules/notes/binding/note_binding.dart';
import 'package:notes_app/modules/notes/model/note.dart';
import 'package:notes_app/modules/notes/views/spalsh_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(
    NoteAdapter()
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: NoteBinding(),
      getPages: [
        GetPage(name: '/', page: () => SpalshPage()),
      ],
    );
  }
}