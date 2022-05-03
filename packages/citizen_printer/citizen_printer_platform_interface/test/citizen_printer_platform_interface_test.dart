// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:citizen_printer_platform_interface/citizen_printer_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class CitizenPrinterMock extends CitizenPrinterPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CitizenPrinterPlatformInterface', () {
    late CitizenPrinterPlatform citizenPrinterPlatform;

    setUp(() {
      citizenPrinterPlatform = CitizenPrinterMock();
      CitizenPrinterPlatform.instance = citizenPrinterPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await CitizenPrinterPlatform.instance.getPlatformName(),
          equals(CitizenPrinterMock.mockPlatformName),
        );
      });
    });
  });
}
