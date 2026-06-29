import 'package:get/get.dart';
import 'package:notes_app/modules/notes/controller/note_controller.dart';
import 'package:notes_app/modules/notes/service/note_service.dart';

class NoteBinding extends Bindings{
  @override
  void dependencies() {
    
    Get.putAsync<NoteService>(
      () async {
        final service = NoteService();
        await service.init();
        return service;
      }
    );

    Get.lazyPut(() => NoteController());

  }
}