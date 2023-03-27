import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class AppLightTheme {
  AppLightTheme._();
  static ThemeData theme(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: _buttonStyle(context)),
        useMaterial3: true,
        outlinedButtonTheme:
            OutlinedButtonThemeData(style: _buttonStyle(context)));
  }

  static ButtonStyle _buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        elevation: 4,
        side: BorderSide.none,
        foregroundColor: Colors.white,
        textStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold),
        backgroundColor: ColorConstants.blueDark,
        fixedSize: const Size(double.infinity, 56));
  }
}
