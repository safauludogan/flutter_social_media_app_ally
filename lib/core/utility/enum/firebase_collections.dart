import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  weeklyPicks,
  story;

  CollectionReference<Object?> get reference =>
      FirebaseFirestore.instance.collection(name);
}
