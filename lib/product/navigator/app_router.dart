import 'package:auto_route/auto_route.dart';
import 'package:flutter_social_media_app_ally/product/navigator/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: EmailVerifyRoute.page, path: '/email_verify'),
  ];
}
