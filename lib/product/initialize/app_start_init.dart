import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/product/manager/locale_cache_manager.dart';
import 'package:get_it/get_it.dart';
import '../../core/init/toast/toast_service.dart';
import '../../firebase_options.dart';
import '../navigator/app_router.dart';

final getIt = GetIt.instance;

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<ToastService>(ToastService());
    await LocaleCacheManager.instance.init();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      GoogleProvider(clientId: ''),
    ]);
  }
}
