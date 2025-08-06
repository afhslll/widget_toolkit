import 'package:flutter/material.dart';

import '../../../helpers/golden_helper.dart';
import '../factory/bottom_sheet_factory.dart';

// TODO: Modal bottom sheet not appearing in golden tests
void main() {
  runUiComponentGoldenTests(
    scenario: 'bottom_sheet_test',
    size: const Size(500, 500),
    scenarioPadding: const EdgeInsets.all(16),
    children: [bottomSheetFactory()],
  );
}
