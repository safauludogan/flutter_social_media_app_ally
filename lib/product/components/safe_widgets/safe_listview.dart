import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';

class SafeListView extends StatelessWidget {
  const SafeListView(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.noDataWidget,
      this.scrollDirection,
      this.shrinkWrap,
      this.description});
  final int? itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Widget noDataWidget;
  final String? description;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  @override
  Widget build(BuildContext context) {
    if (itemCount == null || itemCount == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.dynamicHeight(0.2), child: noDataWidget),
          description != null
              ? const SizedBox(height: 40)
              : const SizedBox.shrink(),
          description != null
              ? Text(
                  description!,
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.grey),
                )
              : const SizedBox.shrink()
        ],
      ));
    }
    return ListView.builder(
      shrinkWrap: shrinkWrap ?? false,
      scrollDirection: scrollDirection ?? Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
