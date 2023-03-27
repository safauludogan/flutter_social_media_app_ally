import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmailVerifyView extends StatefulWidget {
  const EmailVerifyView({Key? key}) : super(key: key);

  @override
  State<EmailVerifyView> createState() => _EmailVerifyViewState();
}

class _EmailVerifyViewState extends State<EmailVerifyView> {
  late final ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = EmailVerificationController(FirebaseAuth.instance)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _bodyWidget(context, ctrl)));
  }
}

Widget _bodyWidget(BuildContext context, EmailVerificationController ctrl) {
  String url = "https://flutter-social-media-app-ally.firebaseapp.com";
  ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      handleCodeInApp: true,
      androidInstallApp: true,
      androidMinimumVersion: '1',
      url: url,
      androidPackageName: "com.example.flutter_social_media_app_ally");
  switch (ctrl.state) {
    case EmailVerificationState.unresolved:
    case EmailVerificationState.unverified:
      return TextButton(
        onPressed: () {
          ctrl.sendVerificationEmail(
              Theme.of(context).platform, actionCodeSettings);
        },
        child: const Text('Send verification email'),
      );
    case EmailVerificationState.dismissed:
      return const Text("Ok, let's verify your email next time");
    case EmailVerificationState.pending:
    case EmailVerificationState.sending:
      return const CircularProgressIndicator();
    case EmailVerificationState.sent:
      return const Text('Check your email');
    case EmailVerificationState.verified:
      return const Text('Email verified');
    case EmailVerificationState.failed:
      return const Text('Failed to verify email');
  }
}
