// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:citizen_printer_platform_interface/src/method_channel_citizen_printer.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of citizen_printer must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `CitizenPrinter`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [CitizenPrinterPlatform] methods.
abstract class CitizenPrinterPlatform extends PlatformInterface {
  /// Constructs a CitizenPrinterPlatform.
  CitizenPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static CitizenPrinterPlatform _instance = MethodChannelCitizenPrinter();

  /// The default instance of [CitizenPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelCitizenPrinter].
  static CitizenPrinterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [CitizenPrinterPlatform] when they register themselves.
  static set instance(CitizenPrinterPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
