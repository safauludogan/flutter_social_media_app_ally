import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/core/constants/string_constants.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';
import 'package:flutter_social_media_app_ally/feature/home/home_provider.dart';
import 'package:flutter_social_media_app_ally/product/components/widgets/loading_view.dart';

import '../../product/components/safe_widgets/safe_listview.dart';
import '../../product/components/widgets/cache_network_image.dart';
import 'components/story_card_view.dart';
import 'components/weeklypicks_card_view.dart';

final StateNotifierProvider<HomeNotifier, HomeState> homeProvider =
    StateNotifierProvider((ref) => HomeNotifier());

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(homeProvider.notifier).fetchAndLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Welcome Safa,',
        style:
            context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
      )),
      body: Center(
          child: SafeArea(
        child: Padding(
          padding: context.paddingTopLow,
          child: Stack(
            children: [
              ListView(
                padding: context.paddingNormal,
                children: [
                  StoryCard(homeProvider),
                  const DynamicHeight(),
                  WeeklyPicksCard(homeProvider),
                  const DynamicHeight(),
                ],
              ),
              if (ref.watch(homeProvider).isLoading)
                const Center(child: LoadingView())
            ],
          ),
        ),
      )),
    );
  }
}

class DynamicHeight extends StatelessWidget {
  const DynamicHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.mediumValue);
  }
}
