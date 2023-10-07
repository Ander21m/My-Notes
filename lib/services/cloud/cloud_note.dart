
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';

@immutable
class CloudNote{
  final String doucmentId;
  final String ownerUserId;
  final String text;

  const CloudNote({required this.doucmentId,required this.ownerUserId,required this.text});

  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>> snapshot):
  doucmentId = snapshot.id,
  ownerUserId = snapshot.data()[ownerUserIdFieldName],
  text = snapshot.data()[textFieldName] as String;
}