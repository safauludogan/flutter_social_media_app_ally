import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations._();
  static AppLocalizations? _instance;
  static AppLocalizations get instance {
    _instance ??= AppLocalizations._();
    return _instance!;
  }

   Locale get trLocale => const Locale('tr');
   Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];
}
