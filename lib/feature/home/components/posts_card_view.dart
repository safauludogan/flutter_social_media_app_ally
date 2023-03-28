import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';

import '../../../core/constants/string_constants.dart';
import '../../../product/components/safe_widgets/safe_listview.dart';
import '../home_provider.dart';

class PostsCard extends ConsumerWidget {
  const PostsCard(this.homeProvider, {super.key});
  final StateNotifierProvider<HomeNotifier, HomeState> homeProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(homeProvider).postList ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringConstants.postTitle,
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 15),
        SizedBox(
          height: context.dynamicHeight(0.4),
          child: SafeListView(
            itemCount: postList.length,
            itemBuilder: (context, index) => Column(
              children: [
                Image.network(postList[index].image.toString(),
                    fit: BoxFit.cover, width: double.infinity),
              ],
            ),
            noDataWidget: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
/*
Image.network(
                    weeklyPickList[index].image.toString()
*/
