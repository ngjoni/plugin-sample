// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:citizen_printer_platform_interface/citizen_printer_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [CitizenPrinterPlatform].
class CitizenPrinterIOS extends CitizenPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('citizen_printer_ios');

  /// Registers this class as the default instance of [CitizenPrinterPlatform]
  static void registerWith() {
    CitizenPrinterPlatform.instance = CitizenPrinterIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
