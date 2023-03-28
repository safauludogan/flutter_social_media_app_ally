import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/core/constants/color_constants.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';

import '../../../core/constants/string_constants.dart';
import '../../../product/components/safe_widgets/safe_listview.dart';
import '../home_provider.dart';

class WeeklyPicksCard extends ConsumerWidget {
  const WeeklyPicksCard(this.homeProvider, {super.key});
  final StateNotifierProvider<HomeNotifier, HomeState> homeProvider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyPickList = ref.watch(homeProvider).weeklyPickList ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringConstants.weeklyTitle,
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 15),
        SizedBox(
          height: context.dynamicHeight(0.3),
          child: SafeListView(
            itemCount: weeklyPickList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(70), // Image radius
                        child: Image.network(
                            weeklyPickList[index].image.toString(),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(weeklyPickList[index].subtitle.toString(),
                      style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.softBlack)),
                ],
              ),
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
