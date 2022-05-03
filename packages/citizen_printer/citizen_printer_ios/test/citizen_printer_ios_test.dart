// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:citizen_printer_ios/citizen_printer_ios.dart';
import 'package:citizen_printer_platform_interface/citizen_printer_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CitizenPrinterIOS', () {
    const kPlatformName = 'iOS';
    late CitizenPrinterIOS citizenPrinter;
    late List<MethodCall> log;

    setUp(() async {
      citizenPrinter = CitizenPrinterIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(citizenPrinter.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      CitizenPrinterIOS.registerWith();
      expect(CitizenPrinterPlatform.instance, isA<CitizenPrinterIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await citizenPrinter.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
