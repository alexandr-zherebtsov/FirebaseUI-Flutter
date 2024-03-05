import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class SMSCodeScreenBuilder extends StatelessWidget {
  final Object flowKey;
  final fba.FirebaseAuth? auth;
  final AuthAction? action;
  final List<FirebaseUIAction>? actions;
  final SMSCodeBuilder? builder;
  final bool useInherit;

  const SMSCodeScreenBuilder({
    required this.flowKey,
    this.auth,
    this.action,
    this.actions,
    this.builder,
    this.useInherit = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (useInherit) {
      return FirebaseUIActions.inherit(
        from: context,
        child: SMSCodeInputScreen(
          auth: auth,
          action: action,
          flowKey: flowKey,
          actions: actions,
          builder: builder,
        ),
      );
    }
    return SMSCodeInputScreen(
      auth: auth,
      action: action,
      flowKey: flowKey,
      actions: actions,
      builder: builder,
    );
  }
}
