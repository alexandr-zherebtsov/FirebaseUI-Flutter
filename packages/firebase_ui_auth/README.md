# Flutter Firebase Authorization UI

Our project aims to enhance the `firebase_ui_auth` package. This package offers various types of authentication, but it lacks widget customization options, which may be limiting for developers. We aim to expand the capabilities of this package by introducing tools for widget customization, enabling developers to create more personalized and aesthetically fitting authentication solutions. Our work is focused on making the authentication process more flexible and enjoyable for end-users, improving usability, and ensuring a high level of customization.

To achieve this, we want to utilize custom WidgetBuilders that will contain the necessary functionality for developers to create any view they desire. These custom WidgetBuilders will empower developers to customize the authentication interface according to their specific requirements, offering flexibility and versatility in designing authentication screens.

The library contains such builders: `AuthScreenBuilder`, `PhoneScreenBuilder`, `SMSCodeScreenBuilder`, `ProfileScreenBuilder`.

# Installing

```yaml
  firebase_core: ^2.25.4
  firebase_auth: ^4.17.5
  firebase_ui_auth:
    git:
      url: https://github.com/alexandr-zherebtsov/FirebaseUI-Flutter.git
      path: packages/firebase_ui_auth/
      ref: feature/UI-builders
  firebase_ui_oauth_apple:
    git:
      url: https://github.com/alexandr-zherebtsov/FirebaseUI-Flutter.git
      path: packages/firebase_ui_oauth_apple/
      ref: feature/UI-builders
  firebase_ui_oauth_google:
    git:
      url: https://github.com/alexandr-zherebtsov/FirebaseUI-Flutter.git
      path: packages/firebase_ui_oauth_google/
      ref: feature/UI-builders
  firebase_ui_oauth_facebook:
    git:
      url: https://github.com/alexandr-zherebtsov/FirebaseUI-Flutter.git
      path: packages/firebase_ui_oauth_facebook/
      ref: feature/UI-builders
  firebase_ui_oauth_twitter:
    git:
      url: https://github.com/alexandr-zherebtsov/FirebaseUI-Flutter.git
      path: packages/firebase_ui_oauth_twitter/
      ref: feature/UI-builders
```

EmailPasswordBuilder example:
```dart
typedef AuthScreenBuilder = Widget Function(
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
```

Auth UI example:
```dart
AuthScreenBuilder(
  auth: FirebaseAuth.instance,
  providers: FirebaseInitialization.providers,
  builder: (
    BuildContext context,
    AuthAction? authAction,
    VoidCallback? handleDifferentAuthAction,
    TextEditingController emailCtrl,
    TextEditingController passwordCtrl,
    TextEditingController confirmPasswordCtrl,
    bool isLoading,
    Exception? exception,
    VoidCallback? onSubmit,
  ) {
    // Our UI
  },
  actions: [
    AuthStateChangeAction<SignedIn>((context, state) {
      context.router.replaceAll([const UserRoute()]);
    }),
    AuthStateChangeAction<UserCreated>((context, state) {
      context.router.replaceAll([const UserRoute()]);
    }),
  ],
)
```

OAuthProviderButton example:
```dart
OAuthProviderButton(
  provider: FirebaseInitialization.appleProvider,
  useSnackBarExceptions: true,
  snackBarBuilder: AppSnackBar.snackBarBuilder,
  builder: (
    BuildContext context,
    bool? isLoading,
    Exception? exception,
    VoidCallback? onSubmit,
  ) {
    // Our UI
  },
)
```

ProfileBuilder example:
```dart
typedef ProfileBuilder = Widget Function(
  BuildContext context,
  FirebaseAuth auth,
  Future<bool> Function() onSignInRequired,
  ActionCodeSettings? actionCodeSettings,
);
```

Profile UI example:
```dart
ProfileScreenBuilder(
  auth: FirebaseAuth.instance,
  providers: FirebaseInitialization.providers,
  builder: (
    BuildContext context,
    FirebaseAuth auth,
    Future<bool> Function() onSignInRequired,
    ActionCodeSettings? actionCodeSettings,
  ) {
    // Our UI
  },
  actions: [
    SignedOutAction((context) {
      context.router.replaceAll([const AuthRoute()]);
    }),
  ],
)
```

You need to use special widgets for email verification, login and to delete the account: `ProfileEmailVerificationBuilder`, `SignOutButton`, `DeleteAccountButton`.
```dart
ProfileEmailVerificationBadgeBuilder(
  auth: auth,
  actionCodeSettings: actionCodeSettings,
  useSnackBarExceptions: true,
  snackBarBuilder: AppSnackBar.snackBarBuilder,
  builder: (
    BuildContext context,
    EmailVerificationState state,
    bool isLoading,
    bool isAwaiting,
    String title,
    VoidCallback send,
    VoidCallback dismiss,
  ) {
    // Our UI
  },
)
```
```dart
SignOutButton(
  builder: (
    BuildContext context,
    VoidCallback signOut,
  ) {
    return IconButton(
      onPressed: signOut,
      icon: const Icon(Icons.logout),
    );
  },
)
```
```dart
DeleteAccountButton(
  auth: auth,
  onSignInRequired: onSignInRequired,
  showDeleteConfirmationDialog: true,
  builder: (
    BuildContext context,
    bool isLoading,
    VoidCallback delete,
  ) {
    return MainButton(
      title: 'Delete Account',
      loading: isLoading,
      onPressed: delete,
      color: Colors.red,
    );
  },
)
```

So, enhancing the `firebase_ui_auth` library is a extensible solution that can be integrated into any project with any UI, which is not currently possible with this library.



# Firebase UI Auth (Official Documentation)

[![pub package](https://img.shields.io/pub/v/firebase_ui_auth.svg)](https://pub.dev/packages/firebase_ui_auth)

Firebase UI Auth is a set of Flutter widgets and utilities designed to help you build and integrate your user interface with Firebase Authentication.

> Please contribute to the [discussion](https://github.com/firebase/FirebaseUI-Flutter/discussions/6978) with feedback.

## Platform support

| Feature/platform   | Android | iOS | Web              | macOS            | Windows          | Linux            |
| ------------------ | ------- | --- | ---------------- | ---------------- | ---------------- | ---------------- |
| Email              | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Phone              | ✓       | ✓   | ✓                | ╳                | ╳                | ╳                |
| Email link         | ✓       | ✓   | ╳                | ╳                | ╳                | ╳                |
| Email verification | ✓       | ✓   | ✓ <sup>(2)</sup> | ✓ <sup>(2)</sup> | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Sign in with Apple | ✓       | ✓   | ✓                | ✓                | ╳                | ╳                |
| Google Sign in     | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Twitter Login      | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Facebook Sign in   | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |

1. Available with [flutterfire_desktop](https://github.com/invertase/flutterfire_desktop)
2. No deep-linking into app, so email verification link opens a web page

## Installation

```sh
flutter pub add firebase_ui_auth
```

## Example

Here's a quick example that shows how to build a `SignInScreen` and `ProfileScreen` in your app

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(context, '/profile');
              }),
            ],
          );
        },
        '/profile': (context) {
          return ProfileScreen(
            providers: providers,
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }),
            ],
          );
        },
      },
    );
  }
}
```

## Profile screen icons

If you're using `ProfileScreen`, make sure to add the following to your `pubspec.yaml`:

```yaml
fonts:
  - family: SocialIcons
    fonts:
      - asset: packages/firebase_ui_auth/fonts/SocialIcons.ttf
```

## Docs

Find relevant documentation [here](https://github.com/firebase/FirebaseUI-Flutter/tree/main/docs/firebase-ui-auth)

- [Getting started](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/README.md)
- Auth providers.
  - [Email auth provider](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/email.md) – sign in using email and password.
  - [Email verification](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/email-verification.md) - verify email.
  - [Email link sign in](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/email-link.md) - sign in using a link sent to email.
  - [Phone auth provider](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/phone.md) - sign in using phone number.
  - [Universal email sign in](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/universal-email-sign-in.md) - resolve connected providers based on email and sign in using one of those.
  - [OAuth](https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/oauth.md) - sign in using Apple, Google, Facebook or Twitter.

## Issues and feedback

- For issues, please create a new [issue on the repository](https://github.com/firebase/FirebaseUI-Flutter/issues).
- For feature requests, & questions, please use [discussion](https://github.com/firebase/FirebaseUI-Flutter/discussions).
- To contribute a change to this plugin, please review our [contribution guide](https://github.com/firebase/FirebaseUI-Flutter/blob/master/CONTRIBUTING.md) and open a [pull request](https://github.com/firebase/FirebaseUI-Flutter/pulls).
