

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/services/cloud/cloud_storage_constants.dart';

import 'cloud_storage_exceptions.dart';

class FirebaseCloudStorage{

  final notes = FirebaseFirestore.instance.collection("notes");

  Future<void> deleteNote({required String doucmentId})async{
    try{
      await notes.doc(doucmentId).delete();
    }
    catch(e){
      throw CouldNotDeleteNoteException();
    }
  }

  Future<void> UpdateNote({
    required String doucmentId,
    required String text
  }) async{
    try{
      await notes.doc(doucmentId).update({textFieldName : text});

    }
    catch(e){
      throw CouldNoteUpdateNoteException();
    }
  }

  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId})=>
    notes.snapshots().map((event) => event.docs.map((doc) => CloudNote.fromSnapshot(doc)).where((note) => note.ownerUserId == ownerUserId));
    
  Future<CloudNote> createNewNote({required String ownerUserId})async{
    final document = await notes.add({ownerUserIdFieldName:ownerUserId,
      textFieldName:""});
    final fetchNote = await document.get();
    return CloudNote(doucmentId: fetchNote.id, ownerUserId: ownerUserId, text: "");
  }

  Future<Iterable<CloudNote>> getNotes({required String ownerUserId})async{
    try{
      return await notes.where(
        ownerUserIdFieldName,isEqualTo: ownerUserId
      ).get().then((value) => value.docs.map((doc) => CloudNote.fromSnapshot(doc)));
    }
    catch(e){
      throw CouldNotGetAllNoteException();
    }
  }


  static final FirebaseCloudStorage _shared = FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;




}