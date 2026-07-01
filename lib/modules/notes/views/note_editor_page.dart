import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/modules/notes/controller/note_controller.dart';
import 'package:notes_app/modules/notes/model/note.dart';

class NoteEditorPage extends StatefulWidget {
  
  final Note? note;

  const NoteEditorPage({
    super.key,
    this.note,
  });

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {

  final NoteController controller = Get.find<NoteController>();

  late TextEditingController titleController;
  late TextEditingController contentController;

  bool savedAlready = false;

  @override
  void initState() {
    super.initState();
    
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.content ?? '');
  }

  void saveNote() {
    if(savedAlready){
      return;
    }

    savedAlready = true;

    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if(title.isEmpty && content.isEmpty){
      return;
    }

    if(widget.note == null){
      controller.createNote(title, content);
    } else {
      controller.updateNote(widget.note!, title, content);
    }
  }

  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    contentController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        saveNote();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              saveNote();
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back_rounded)
          ),
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24
                ),
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
          
              SizedBox(height: 20,),
          
              Expanded(
                child: TextField(
                    controller: contentController,
                    style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                    ),
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Write something...',
                    ),
                  ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}