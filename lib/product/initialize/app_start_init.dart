import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../firebase_options.dart';
import '../navigator/app_router.dart';

final getIt = GetIt.instance;

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    getIt.registerSingleton<AppRouter>(AppRouter());
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      GoogleProvider(clientId: ''),
    ]);
  }
}
