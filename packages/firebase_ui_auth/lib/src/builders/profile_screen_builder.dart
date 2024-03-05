import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';

import '../../firebase_ui_auth.dart';

class ProfileScreenBuilder extends StatelessWidget {
  final fba.FirebaseAuth? auth;
  final List<AuthProvider>? providers;
  final List<FirebaseUIAction>? actions;
  final ProfileBuilder? builder;
  final AuthSnackBarBuilder? snackBarBuilder;
  final bool useSnackBarExceptions;

  const ProfileScreenBuilder({
    this.auth,
    this.providers,
    this.actions,
    this.builder,
    this.snackBarBuilder,
    this.useSnackBarExceptions = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      auth: auth,
      providers: providers,
      actions: actions,
      builder: builder,
      snackBarBuilder: snackBarBuilder,
      useSnackBarExceptions: useSnackBarExceptions,
    );
  }
}
