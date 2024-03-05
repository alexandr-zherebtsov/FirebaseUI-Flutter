import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_auth/src/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileEmailVerificationBadgeBuilder extends StatelessWidget {
  final fba.FirebaseAuth auth;
  final fba.ActionCodeSettings? actionCodeSettings;
  final AuthSnackBarBuilder? snackBarBuilder;
  final bool useSnackBarExceptions;
  final ProfileEmailVerificationBuilder builder;

  const ProfileEmailVerificationBadgeBuilder({
    required this.auth,
    required this.actionCodeSettings,
    required this.builder,
    this.useSnackBarExceptions = false,
    this.snackBarBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileEmailVerificationBadge(
      auth: auth,
      actionCodeSettings: actionCodeSettings,
      builder: builder,
      useSnackBarExceptions: useSnackBarExceptions,
      snackBarBuilder: snackBarBuilder,
    );
  }
}
