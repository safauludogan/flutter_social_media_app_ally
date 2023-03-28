// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_social_media_app_ally/core/utility/theme/firebase/firebase_utility.dart';
import 'package:flutter_social_media_app_ally/feature/home/model/story_model.dart';

import '../../core/utility/enum/firebase_collections.dart';
import 'model/weeklypicks_model.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  Future<void> getStories() async {
    var items = await FirebaseUtility().fetchList<StoryModel>(
        FirebaseCollections.story.reference, const StoryModel());
    state = state.copyWith(storyList: items);
  }

  Future<void> getWeeklyPicks() async {
    var items = await FirebaseUtility().fetchList(
        FirebaseCollections.weeklyPicks.reference, const WeeklyPicks());
    state = state.copyWith(weeklyPickList: items);
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    await Future.wait([getStories(), getWeeklyPicks()]);
    state = state.copyWith(isLoading: false);
  }
}

@immutable
class HomeState extends Equatable {
  final List<StoryModel>? storyList;
  final List<WeeklyPicks>? weeklyPickList;
  final bool isLoading;
  const HomeState({
    this.storyList,
    this.weeklyPickList,
    this.isLoading = true,
  });

  @override
  List<Object?> get props => [storyList, weeklyPickList, isLoading];

  HomeState copyWith({
    List<StoryModel>? storyList,
    List<WeeklyPicks>? weeklyPickList,
    bool? isLoading,
  }) {
    return HomeState(
      storyList: storyList ?? this.storyList,
      weeklyPickList: weeklyPickList ?? this.weeklyPickList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
