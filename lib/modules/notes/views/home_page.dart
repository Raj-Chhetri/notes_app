import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/modules/notes/controller/note_controller.dart';
import 'package:notes_app/modules/notes/views/note_editor_page.dart';
import 'package:notes_app/modules/notes/views/widgets/note_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NoteController controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        actions: [
          Card(
            elevation: 5,
            child: IconButton(
              onPressed: (){
                Get.to(()=> NoteEditorPage());
              },
              icon: Icon(Icons.add)
              ),
          )
        ],
      ),

      body:
          Expanded(
            child: Obx((){
              if(controller.isLoading.value){
                return Center(child: CircularProgressIndicator(),);
              }
            
              if(controller.error.value.isNotEmpty){
                return Center(child: Text(controller.error.value),);
              }
            
              if(controller.notes.isEmpty){
                return Center(child: Text("No notes yet"),);
              }
            
              return ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder:(BuildContext context, index) {
                  final note = controller.notes[index];
            
                  return NoteCard(
                    note: note,
                    onTap: (){
                      Get.to(() => NoteEditorPage(note: note));
                    },
            
                    onLongPress: (){
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) {
                          return SafeArea(
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text("Delete"),
                              onTap: (){
                                controller.deleteNote(note);
                                Get.back();
                              },
                            )
                          );
                        },
                      );
                    }, 
                    onDelete: () {
                      controller.deleteNote(note);
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}