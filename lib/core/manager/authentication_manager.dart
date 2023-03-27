import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_media_app_ally/core/constants/string_constants.dart';
import 'package:flutter_social_media_app_ally/product/initialize/app_start_init.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.gr.dart';

import '../../product/manager/locale_cache_manager.dart';
import '../init/toast/toast_service.dart';

class AuthenticationManager {
  AuthenticationManager._();
  static final AuthenticationManager _instance = AuthenticationManager._();
  static AuthenticationManager get instance => _instance;

  Future<void> login(User user) async {
    final token = await user.getIdToken();
    LocaleCacheManager.instance.setString(CachePrefKey.token, token);
    getIt<ToastService>().showToast(label: StringConstants.loginSuccess);
    getIt<AppRouter>().replace(const HomeRoute());
  }

  Future<void> logout() async {
    await LocaleCacheManager.instance.clearAll();
    getIt<ToastService>().showToast(label: StringConstants.logout);
    getIt<AppRouter>().replace(const LoginRoute());
  }

  bool checkLoginStatus() {
    final token = LocaleCacheManager.instance.getString(CachePrefKey.token);
    return token == null ? false : true;
  }
}
