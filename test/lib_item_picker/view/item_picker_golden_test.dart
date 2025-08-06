import 'package:mockito/annotations.dart';

import '../../helpers/golden_helper.dart';
import '../factory/item_picker_factory.dart';
import '../services/item_picker_service_mock.dart';
import '../stubs.dart';

@GenerateMocks([ItemPickerServiceMock])
void main() {
  runGoldenTests([
    buildScenario(
      scenario: 'item_picker_empty',
      widget: itemPickerFactory(itemsResult: Stubs.itemPickerDataEmpty),
    ),
    buildScenario(
      scenario: 'item_picker_success',
      widget: itemPickerFactory(itemsResult: Stubs.itemPickerDataSuccessResult),
    ),
    buildScenario(
      scenario: 'item_picker_loading',
      widget: itemPickerFactory(itemsResult: Stubs.itemPickerLoading),
    ),
    buildScenario(
      scenario: 'item_picker_error',
      widget: itemPickerFactory(itemsResult: Stubs.itemPickerError),
    ),
  ]);
}
