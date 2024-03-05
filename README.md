# Flutter Firebase Authorization UI

Our project aims to enhance the `firebase_ui_auth` package. This package offers various types of authentication, but it lacks widget customization options, which may be limiting for developers. We aim to expand the capabilities of this package by introducing tools for widget customization, enabling developers to create more personalized and aesthetically fitting authentication solutions. Our work is focused on making the authentication process more flexible and enjoyable for end-users, improving usability, and ensuring a high level of customization.

To achieve this, we want to utilize custom WidgetBuilders that will contain the necessary functionality for developers to create any view they desire. These custom WidgetBuilders will empower developers to customize the authentication interface according to their specific requirements, offering flexibility and versatility in designing authentication screens.

The library contains such builders: `AuthScreenBuilder`, `PhoneScreenBuilder`, `ProfileScreenBuilder`, `SMSCodeScreenBuilder`.

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

AuthScreenBuilder example:
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

ProfileBuilder example:
```dart
typedef ProfileBuilder = Widget Function(
  BuildContext context,
  FirebaseAuth auth,
  Future<bool> Function() onSignInRequired,
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

You need to use special widgets for login and to delete the account:
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


# Firebase UI for Flutter (Official Documentation)

Firebase UI is a set of plugins for Flutter that allows you to quickly connect common UI elements to Firebase APIs.

## Available plugins

| package                                                                | pub                                                                                                                                |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| [`firebase_ui_auth`](./packages/firebase_ui_auth/)                     | [![pub package](https://img.shields.io/pub/v/firebase_ui_auth.svg)](https://pub.dev/packages/firebase_ui_auth)                     |
| [`firebase_ui_database`](./packages/firebase_ui_database/)             | [![pub package](https://img.shields.io/pub/v/firebase_ui_database.svg)](https://pub.dev/packages/firebase_ui_database)             |
| [`firebase_ui_firestore`](./packages/firebase_ui_firestore/)           | [![pub package](https://img.shields.io/pub/v/firebase_ui_firestore.svg)](https://pub.dev/packages/firebase_ui_firestore)           |
| [`firebase_ui_localizations`](./packages/firebase_ui_localizations/)   | [![pub package](https://img.shields.io/pub/v/firebase_ui_localizations.svg)](https://pub.dev/packages/firebase_ui_localizations)   |
| [`firebase_ui_oauth`](./packages/firebase_ui_oauth/)                   | [![pub package](https://img.shields.io/pub/v/firebase_ui_oauth.svg)](https://pub.dev/packages/firebase_ui_oauth)                   |
| [`firebase_ui_oauth_apple`](./packages/firebase_ui_oauth_apple/)       | [![pub package](https://img.shields.io/pub/v/firebase_ui_oauth_apple.svg)](https://pub.dev/packages/firebase_ui_oauth_apple)       |
| [`firebase_ui_oauth_facebook`](./packages/firebase_ui_oauth_facebook/) | [![pub package](https://img.shields.io/pub/v/firebase_ui_oauth_facebook.svg)](https://pub.dev/packages/firebase_ui_oauth_facebook) |
| [`firebase_ui_oauth_google`](./packages/firebase_ui_oauth_google/)     | [![pub package](https://img.shields.io/pub/v/firebase_ui_oauth_google.svg)](https://pub.dev/packages/firebase_ui_oauth_google)     |
| [`firebase_ui_oauth_twitter`](./packages/firebase_ui_oauth_twitter/)   | [![pub package](https://img.shields.io/pub/v/firebase_ui_oauth_twitter.svg)](https://pub.dev/packages/firebase_ui_oauth_twitter)   |
| [`firebase_ui_storage`](./packages/firebase_ui_storage/)               | [![pub package](https://img.shields.io/pub/v/firebase_ui_storage.svg)](https://pub.dev/packages/firebase_ui_storage)               |

## Issues

Please file Firebase UI specific issues, bugs, or feature requests in our [issue tracker](https://github.com/firebase/FirebaseUI-Flutter/issues/new/choose).

## Contributing

If you wish to contribute a change to any of the existing plugins in this repo, please review our [contribution guide](https://github.com/firebase/FirebaseUI-Flutter/blob/main/CONTRIBUTING.md) and open a [pull request](https://github.com/firebase/FirebaseUI-Flutter/pulls).
