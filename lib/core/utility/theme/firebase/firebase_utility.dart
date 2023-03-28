import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_firebase_model.dart';

class FirebaseUtility {
  Future<List<T>?> fetchList<T extends BaseFirebaseModel>(
      CollectionReference<Object?> collectionReference, T model) async {
    var response = await collectionReference
        .withConverter<T>(
            fromFirestore: (snapshot, options) {
              final value = snapshot.data()!;
              value.addEntries([MapEntry('id', snapshot.id)]);
              return model.fromJson(value);
            },
            toFirestore: (value, options) => value.toJson())
        .get();
    if (response.docs.isEmpty) return null;
    final value = response.docs.map((e) => e.data()).toList();
    return value;
  }
}
