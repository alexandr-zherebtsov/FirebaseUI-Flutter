import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExceptionManager {
  static String Function(
    BuildContext context,
    fba.FirebaseAuthException exception,
  )? localizeError;

  static String Function(
    BuildContext context,
    PlatformException exception,
  )? localizePlatformError;

  static void showSnackBar({
    required final BuildContext context,
    required final Exception? exception,
    required final AuthSnackBarBuilder? snackBarBuilder,
  }) {
    final SnackBar snackBar = snackBarBuilder != null
        ? snackBarBuilder(
            context,
            exceptionText(
              context: context,
              exception: exception,
            ),
            null,
            true,
          )
        : SnackBar(
            content: Text(
              exceptionText(
                context: context,
                exception: exception,
              ),
            ),
          );
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static String exceptionText({
    required final BuildContext context,
    required final Exception? exception,
  }) {
    dev.log(exception.toString(), name: 'AUTH EXCEPTION');

    final l = FirebaseUILocalizations.labelsOf(context);
    String text = l.unknownError;

    if (exception is AutoresolutionFailedException) {
      text = l.smsAutoresolutionFailedError;
    }

    if (exception is fba.FirebaseAuthException) {
      if (localizeError != null) {
        text = localizeError!(context, exception);
      } else {
        final e = exception;
        final code = e.code;
        final newText = localizedErrorText(code, l) ?? e.message;

        if (newText != null) {
          text = newText;
        }
      }
    }

    if (exception is PlatformException && localizePlatformError != null) {
      text = localizePlatformError!(context, exception);
    }

    return text;
  }
}
