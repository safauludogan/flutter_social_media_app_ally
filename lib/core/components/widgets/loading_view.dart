import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/core/extension/context_extension.dart';

import '../../constants/color_constants.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key, this.color, this.size});
  final Color? color;
  final double? size;

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height:context.dynamicHeight( widget.size ?? 0.03),
      width: context.dynamicHeight( widget.size ?? 0.03),
      child: CircularProgressIndicator(
          color: widget.color ?? ColorConstants.blueDark),
    ));
  }
}
