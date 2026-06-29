import 'package:flutter/material.dart';
import 'package:notes_app/modules/notes/model/note.dart';

class NoteCard extends StatelessWidget {

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
                
              SizedBox(height: 10,),
                
              Text(
                note.content
              )
            ],
          ),
        ),
      ),
    );
  }
}