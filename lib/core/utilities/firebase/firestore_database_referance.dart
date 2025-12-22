import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseReference {
  users,
  campaings,
  user_info,
  restaurants,
  tickets,
  products;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
