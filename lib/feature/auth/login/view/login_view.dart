import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_media_app_ally/feature/auth/login/login_provider.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late final StateNotifierProvider<LoginNotifier, LoginState> loginProvider;
  @override
  void initState() {
    super.initState();
    loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
        (ref) => LoginNotifier());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          if (ref.watch(loginProvider).isLogged) const Text('Sad'),
          Expanded(
            child: SignInScreen(
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  if (state.user != null) {
                    ref.read(loginProvider.notifier).saveLoginData(state.user);
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}


/* if (!state.user!.emailVerified) {
        //getIt<AppRouter>().push(const EmailVerifyRoute());
      } else {
        //getIt<AppRouter>().replace(const HomeRoute());
      }*/