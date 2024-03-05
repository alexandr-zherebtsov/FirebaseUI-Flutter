// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@template ui.auth.widgets.sign_out_button}
/// A button that signs out the user when pressed.
/// {@endtemplate}
class SignOutButton extends StatelessWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// {@macro ui.shared.widgets.button_variant}
  final ButtonVariant variant;

  final bool showSignOutDialog;

  final SignOutBuilder? builder;

  /// {@macro ui.auth.widgets.sign_out_button}
  const SignOutButton({
    super.key,
    this.auth,
    this.variant = ButtonVariant.filled,
    this.showSignOutDialog = false,
    this.builder,
  });

  Future<void> _signOut({
    required final BuildContext context,
    required final fba.FirebaseAuth? auth,
  }) async {
    bool confirmed = true;
    if (showSignOutDialog) {
      final l = FirebaseUILocalizations.labelsOf(context);
      confirmed = await showAdaptiveDialog<bool?>(
            context: context,
            builder: (context) {
              return UniversalAlert(
                onConfirm: () => Navigator.of(context).pop(true),
                onCancel: () => Navigator.of(context).pop(false),
                title: l.signOut,
                confirmButtonText: l.okButtonLabel,
                cancelButtonText: l.cancelButtonLabel,
                message: l.signOutDescription,
              );
            },
          ) ??
          false;
      if (!confirmed) return;
      FirebaseUIAuth.signOut(
        context: context,
        auth: auth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);
    if (builder != null) {
      return builder!(
        context,
        () => _signOut(
          context: context,
          auth: auth,
        ),
      );
    }
    return UniversalButton(
      text: l.signOutButtonText,
      onPressed: () => _signOut(
        context: context,
        auth: auth,
      ),
      cupertinoIcon: CupertinoIcons.arrow_right_circle,
      materialIcon: Icons.logout,
      variant: variant,
    );
  }
}
