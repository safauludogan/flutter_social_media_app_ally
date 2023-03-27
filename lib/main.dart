import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/core/constants/app_localizations.dart';
import 'package:flutter_social_media_app_ally/core/constants/string_constants.dart';
import 'package:flutter_social_media_app_ally/product/initialize/app_start_init.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.dart';

import 'core/utility/theme/app_light_theme.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      theme: AppLightTheme.theme(context),
      title: StringConstants.AppName,
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),
      locale: AppLocalizations.instance.trLocale,
      localizationsDelegates: AppLocalizations.instance.localizationsDelegates,
    );
  }
}
