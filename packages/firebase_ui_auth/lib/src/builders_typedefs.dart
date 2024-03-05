import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';

import '../firebase_ui_auth.dart';

typedef EmailPasswordBuilder = Widget Function(
  BuildContext context,
  AuthAction? authAction,
  VoidCallback? handleDifferentAuthAction,
  TextEditingController emailCtrl,
  TextEditingController passwordCtrl,
  TextEditingController confirmPasswordCtrl,
  bool isLoading,
  Exception? exception,
  VoidCallback? onSubmit,
);

typedef SignOutBuilder = Widget Function(
  BuildContext context,
  VoidCallback signOut,
);

typedef DeleteAccountBuilder = Widget Function(
  BuildContext context,
  bool isLoading,
  VoidCallback delete,
);

typedef ProfileBuilder = Widget Function(
  BuildContext context,
  fba.FirebaseAuth auth,
  Future<bool> Function() onSignInRequired,
  fba.ActionCodeSettings? actionCodeSettings,
);

typedef ProfileEmailVerificationBuilder = Widget Function(
  BuildContext context,
  EmailVerificationState state,
  bool isLoading,
  bool isAwaiting,
  String title,
  VoidCallback send,
  VoidCallback dismiss,
);

typedef PhoneNumberBuilder = Widget Function(
  BuildContext context,
  Object? flowKey,
  fba.FirebaseAuth? auth,
  AuthState state,
  AuthAction? action,
  TextEditingController phoneCtrl,
  Exception? exception,
  void Function(String?)? sendCode,
);

typedef SMSCodeBuilder = Widget Function(
  BuildContext context,
  bool isLoading,
  Exception? exception,
  void Function(String?)? onSubmit,
);

typedef OAuthButtonBuilder = Widget Function(
  BuildContext context,
  bool? isLoading,
  Exception? exception,
  VoidCallback? onSubmit,
);

typedef AuthSnackBarBuilder = SnackBar Function(
  BuildContext context,
  String? title,
  String? subtitle,
  bool? isError,
);
