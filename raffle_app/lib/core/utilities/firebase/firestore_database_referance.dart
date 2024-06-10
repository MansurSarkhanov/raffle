import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseReference {
  users;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
