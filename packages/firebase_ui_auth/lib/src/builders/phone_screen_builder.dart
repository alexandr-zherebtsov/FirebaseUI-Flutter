import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class PhoneScreenBuilder extends StatelessWidget {
  final fba.FirebaseAuth? auth;
  final AuthAction? action;
  final List<FirebaseUIAction> actions;
  final List<FirebaseUIAction>? phoneActions;
  final List<AuthProvider>? providers;
  final PhoneNumberBuilder? builder;
  final AuthSnackBarBuilder? snackBarBuilder;
  final bool useSnackBarExceptions;

  const PhoneScreenBuilder({
    this.auth,
    this.action,
    this.actions = const [],
    this.phoneActions,
    this.providers,
    this.builder,
    this.snackBarBuilder,
    this.useSnackBarExceptions = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      startAction: action,
      auth: auth,
      providers: providers,
      actions: actions,
      snackBarBuilder: snackBarBuilder,
      useSnackBarExceptions: useSnackBarExceptions,
      phoneBuilder: PhoneInputScreen(
        auth: auth,
        action: action,
        actions: phoneActions,
        builder: builder,
        snackBarBuilder: snackBarBuilder,
        useSnackBarExceptions: useSnackBarExceptions,
      ),
    );
  }
}
