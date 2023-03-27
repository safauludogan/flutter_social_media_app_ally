// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/manager/authentication_manager.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState());

  Future<void> saveLoginData(User? user) async {
    if (user == null) return;
    AuthenticationManager.instance.login(user);
    state = state.copyWith(isLogged: true);
  }
}

@immutable
class LoginState extends Equatable {
  const LoginState({this.isLogged = false});
  final bool isLogged;

  LoginState copyWith({
    bool? isLogged,
  }) {
    return LoginState(
      isLogged: isLogged ?? this.isLogged,
    );
  }

  @override
  List<Object?> get props => [isLogged];
}
