// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

export 'src/loading_button.dart' show LoadingButton;
export 'src/loading_indicator.dart' show LoadingIndicator;
export 'src/platform_widget.dart' show PlatformWidget;
export 'src/themed.dart' show ThemedValue, ThemedColor, ThemedIconSrc;
export 'src/universal_alert.dart' show UniversalAlert;
export 'src/universal_button.dart' show UniversalButton, ButtonVariant;
export 'src/universal_icon.dart' show UniversalIcon;
export 'src/universal_scaffold.dart' show UniversalScaffold;

class PlatformActionUI {
  static bool isApplePlatform() {
    return defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool isApple() {
    return false;
    // Cupertino style UI is not supported
    // return defaultTargetPlatform == TargetPlatform.macOS ||
    //     defaultTargetPlatform == TargetPlatform.iOS;
  }
}
