import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/modules/notes/model/note.dart';

class NoteCard extends StatelessWidget {

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onLongPress,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
      ),
      child: Slidable(
        key: ValueKey(note.id),
        direction: Axis.horizontal,
        endActionPane: ActionPane(
          motion: DrawerMotion(), 
          extentRatio: 0.3,
          children: [
            SlidableAction(
              onPressed: (_){
                onDelete();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            )
          ]
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Card(
            elevation: 3,
            margin: EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                      
                    SizedBox(height: 10,),
                      
                    Text(
                      note.content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}