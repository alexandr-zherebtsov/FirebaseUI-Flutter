// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniversalAlert extends StatelessWidget {
  final void Function() onConfirm;
  final void Function() onCancel;

  final String title;
  final String message;

  final String confirmButtonText;
  final String cancelButtonText;

  const UniversalAlert({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.message,
  });

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
    bool isDestructiveAction = false,
  }) {
    if (PlatformActionUI.isApplePlatform()) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        isDestructiveAction: isDestructiveAction,
        child: child,
      );
    }
    return TextButton(onPressed: onPressed, child: child);
  }

  Widget buildMaterial(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: onConfirm,
          child: Text(confirmButtonText),
          isDestructiveAction: true,
        ),
        adaptiveAction(
          context: context,
          onPressed: onCancel,
          child: Text(cancelButtonText),
        ),
      ],
    );
  }

  Widget buildCupertino(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: onConfirm,
          child: Text(confirmButtonText),
          isDestructiveAction: true,
        ),
        adaptiveAction(
          context: context,
          onPressed: onCancel,
          child: Text(cancelButtonText),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformActionUI.isApplePlatform()) {
      return buildCupertino(context);
    }
    return buildMaterial(context);
  }
}
