import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';
import 'package:flutter_social_media_app_ally/feature/home/home_provider.dart';

import '../../core/components/widgets/cache_network_image.dart';
import 'model/story_model.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  late final StateNotifierProvider<HomeNotifier, HomeState> homeProvider;
  @override
  void initState() {
    super.initState();
    homeProvider = StateNotifierProvider((ref) => HomeNotifier());
    ref.read(homeProvider.notifier).getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: ref.read(homeProvider.notifier).getStories(),
          builder:
              (context, AsyncSnapshot<QuerySnapshot<StoryModel?>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const CircularProgressIndicator();

              case ConnectionState.done:
                if (snapshot.hasData) {
                  final values =
                      snapshot.data!.docs.map((e) => e.data()).toList();
                  return ListView.builder(
                    itemCount: values.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: NetworkImageView(
                          image: values[index]!.image.toString()),
                    ),
                    shrinkWrap: true,
                  );
                }
                return const Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }
}
