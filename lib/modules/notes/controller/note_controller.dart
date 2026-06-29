import 'package:get/get.dart';
import 'package:notes_app/modules/notes/model/note.dart';
import 'package:notes_app/modules/notes/service/note_service.dart';
import 'package:uuid/uuid.dart';

class NoteController extends GetxController{

  final NoteService service = Get.find<NoteService>();

  final uuid = const Uuid();

  final notes = <Note>[].obs;

  final isLoading = false.obs;
  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();

    loadNotes();
  }

  void loadNotes(){
    try{
      isLoading.value = true;
      error.value = '';

      notes.value = service.loadNotes();
    } catch(e){
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void createNote(String title, String content){
    final note = Note(
      id: uuid.v4(), 
      title: title, 
      content: content, 
      updatedAt: DateTime.now()
    );

    service.createNote(note);

    loadNotes();
  }

  void updateNote(
    Note oldNote, 
    String title, 
    String content
    ){
      final updatedNote = Note(
        id: oldNote.id, 
        title: title, 
        content: content, 
        updatedAt: DateTime.now()
      );

    service.updateNote(updatedNote);

    loadNotes();
  }

  void deleteNote(Note note){
    service.deleteNote(note);
    loadNotes();
  }




}