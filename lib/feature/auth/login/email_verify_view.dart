import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class EmailVerifyView extends StatefulWidget {
  const EmailVerifyView({Key? key}) : super(key: key);

  @override
  State<EmailVerifyView> createState() => _EmailVerifyViewState();
}

class _EmailVerifyViewState extends State<EmailVerifyView> {
  late final ctrl = EmailVerificationController(FirebaseAuth.instance)
    ..addListener(() {
      // trigger widget rebuild to reflect new state
      setState(() {});
    });

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
        child: Text('Send verification email'),
      );
    case EmailVerificationState.dismissed:
      return Text("Ok, let's verify your email next time");
    case EmailVerificationState.pending:
    case EmailVerificationState.sending:
      return CircularProgressIndicator();
    case EmailVerificationState.sent:
      return Text('Check your email');
    case EmailVerificationState.verified:
      return Text('Email verified');
    case EmailVerificationState.failed:
      return Text('Failed to verify email');
  }
}
