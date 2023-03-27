import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app_ally/feature/auth/login/email_verify_view.dart';
import 'package:flutter_social_media_app_ally/feature/home/home_view.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EmailVerifyView()));
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeView()));
          }
        }),
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            '/forgot-password',
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EmailVerifyView()));
          } else {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EmailVerifyView()));
          } else {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        }),
        //  mfaAction,
        EmailLinkSignInAction((context) {
          Navigator.pushReplacementNamed(context, '/email-link-sign-in');
        }),
      ],
    ));
  }
}
