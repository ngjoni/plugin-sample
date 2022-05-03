// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:citizen_printer/citizen_printer.dart';
import 'package:citizen_printer_platform_interface/citizen_printer_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCitizenPrinterPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements CitizenPrinterPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CitizenPrinter', () {
    late CitizenPrinterPlatform citizenPrinterPlatform;

    setUp(() {
      citizenPrinterPlatform = MockCitizenPrinterPlatform();
      CitizenPrinterPlatform.instance = citizenPrinterPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => citizenPrinterPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => citizenPrinterPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
