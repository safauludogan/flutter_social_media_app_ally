import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';

import '../../../product/components/safe_widgets/safe_listview.dart';
import '../../../product/components/widgets/cache_network_image.dart';
import '../home_provider.dart';

class StoryCard extends ConsumerWidget {
  const StoryCard(this.homeProvider, {super.key});
  final StateNotifierProvider<HomeNotifier, HomeState> homeProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyList = ref.watch(homeProvider).storyList ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Artists like Bonee',
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w500)),
        SizedBox(
          height: context.dynamicHeight(0.15),
          child: SafeListView(
            itemCount: storyList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: NetworkImageView(image: storyList[index].image.toString()),
            ),
            noDataWidget: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
