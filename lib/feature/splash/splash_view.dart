import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/core/constants/color_constants.dart';
import 'package:flutter_social_media_app_ally/core/manager/authentication_manager.dart';
import 'package:flutter_social_media_app_ally/product/initialize/app_start_init.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.gr.dart';

import '../../product/components/widgets/image_widget.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    if (FirebaseAuth.instance.currentUser == null ||
        !AuthenticationManager.instance.checkLoginStatus()) {
      getIt<AppRouter>().replace(const LoginRoute());
    } else {
      getIt<AppRouter>().replace(const HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blueDark,
      body: Center(child: ImageConstants.splash.toWidget),
    );
  }
}
