import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  posts,
  weeklyPicks,
  story;

  CollectionReference<Object?> get reference =>
      FirebaseFirestore.instance.collection(name);
}
