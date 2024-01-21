import 'package:flutter_test/flutter_test.dart';
import 'package:plastic_diver/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LeaderboardViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
