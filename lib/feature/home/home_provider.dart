import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/feature/home/model/story_model.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  Future<QuerySnapshot<StoryModel>> getStories() async {
    CollectionReference stories =
        FirebaseFirestore.instance.collection('story');
    var response = await stories
        .withConverter<StoryModel>(
          fromFirestore: (snapshot, options) =>
              StoryModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .get();
    //response.docs.map((e) => debugPrint(e.data().image.toString())).toList();
    return response;
  }
}

@immutable
class HomeState {}
