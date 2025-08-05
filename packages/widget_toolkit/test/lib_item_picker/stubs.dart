import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../lib_item_picker/models/item_picker_data_mock.dart';

class Stubs {
  static List<ItemPickerDataMock> itemPickerData = <ItemPickerDataMock>[
    ItemPickerDataMock('name 1'),
    ItemPickerDataMock('name 2'),
  ];
  static Result<List<ItemPickerDataMock>> itemPickerDataEmpty = Result.success(
    <ItemPickerDataMock>[],
  );
  static Result<List<ItemPickerDataMock>> itemPickerDataSuccessResult =
      Result.success(<ItemPickerDataMock>[
        ItemPickerDataMock('name 1'),
        ItemPickerDataMock('name 2'),
      ]);
  static Result<List<ItemPickerDataMock>> itemPickerError =
      Result<List<ItemPickerDataMock>>.error(GenericErrorModel(''));
  static Result<List<ItemPickerDataMock>> itemPickerLoading =
      Result<List<ItemPickerDataMock>>.loading();
}
