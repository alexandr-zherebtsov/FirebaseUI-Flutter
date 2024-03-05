import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';

import '../../firebase_ui_auth.dart';

class AuthScreenBuilder extends StatelessWidget {
  final AuthAction? startAction;
  final fba.FirebaseAuth? auth;
  final List<AuthProvider>? providers;
  final EmailAuthProvider? emailPasswordProvider;
  final List<FirebaseUIAction> actions;
  final EmailPasswordBuilder? builder;
  final AuthSnackBarBuilder? snackBarBuilder;
  final bool useSnackBarExceptions;

  const AuthScreenBuilder({
    this.startAction,
    this.auth,
    this.providers,
    this.emailPasswordProvider,
    this.actions = const [],
    this.builder,
    this.snackBarBuilder,
    this.useSnackBarExceptions = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      startAction: startAction,
      auth: auth,
      providers: providers,
      emailPasswordProvider: emailPasswordProvider,
      actions: actions,
      emailPasswordBuilder: builder,
      snackBarBuilder: snackBarBuilder,
      useSnackBarExceptions: useSnackBarExceptions,
    );
  }
}
