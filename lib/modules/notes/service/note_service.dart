import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/modules/notes/model/note.dart';

class NoteService {

  // connect to the database box
  late Box<Note> box;

  Future<void> init() async {
    box = await Hive.openBox('notes');
  }

  // CRUD operations start here

  // Read Operation
  List<Note> loadNotes() {
    return box.values.toList();
  }

  // Create Operation
  void createNote(Note note){
    box.add(note);
  }

  // Update Operaion
  void updateNote(Note updatedNote){
    final index = box.values.toList().indexWhere(
      (note) => note.id == updatedNote.id
    );

    if(index == -1){
      return;
    }

    box.putAt(index, updatedNote);
  }

  // Delete Operation
  void deleteNote(Note note){
    final index = box.values.toList().indexWhere(
      (item) => item.id == note.id
    );

    if(index == -1){
      return;
    }

    box.deleteAt(index);
  }
}
