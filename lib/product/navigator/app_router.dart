import 'package:auto_route/auto_route.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.gr.dart';

import '../../feature/splash/splash_view.dart';

/*
@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: '/', initial: true)
  ],
)
class AppRouter extends _$AppRouter {}
*/

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
  ];
}
