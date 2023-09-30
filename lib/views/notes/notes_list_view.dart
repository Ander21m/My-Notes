import 'package:flutter/material.dart';
import 'package:mynotes/services/auth/crud/notes_services.dart';

import '../../utilities/dialogs/delete.dialog.dart';

typedef DeleteNoteCallBack = void Function(DatabaseNote note);
class NoteListView extends StatelessWidget {

  final List<DatabaseNote> notes;
  final DeleteNoteCallBack onDeleteNote;
  const NoteListView({super.key, required this.notes, required this.onDeleteNote});

  @override
  Widget build(BuildContext context) {
     return ListView.builder(itemCount: notes.length,itemBuilder: (context, index) {
      final note = notes[index];
      return ListTile(title: Text(note.text,maxLines: 1,softWrap: true,overflow: TextOverflow.ellipsis,),
      trailing: IconButton(
        onPressed: () async{
          final shoulDelete = await showDeleteDialog(context);
          if(shoulDelete){
            onDeleteNote(note);
          }
        },
        icon: const Icon(Icons.delete), 
      ),
      );
      },);
  }
}