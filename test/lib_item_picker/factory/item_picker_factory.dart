import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/src/lib_item_picker/blocs/item_picker_bloc.dart';
import 'package:widget_toolkit/src/lib_item_picker/views/item_picker_page.dart';

import '../mock/item_picker_mock.dart';
import '../models/item_picker_data_mock.dart';

Widget itemPickerFactory({
  required Result<List<ItemPickerDataMock>> itemsResult,
}) => Scaffold(
  body: MultiProvider(
    providers: [
      Provider<ItemPickerBlocType<ItemPickerDataMock>>.value(
        value: itemPickerMockFactory(itemsResult: itemsResult),
      ),
    ],
    child: ItemPickerPage<ItemPickerDataMock>(
      title: 'Testing',
      saveButtonText: 'Save Button',
      emptyBuilder: () => const Text('Empty'),
      errorBuilder: (error) => Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red[100],
        child: Text('Error :$error'),
      ),
      footerBuilder: (context) => Container(
        padding: const EdgeInsets.all(10),
        child: const Text('Footer'),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, model, isSelected, isLoading) => Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(10),
        color: Colors.grey[100],
        child: Text('Item ${model?.value}'),
      ),
      selectedItems: const <ItemPickerDataMock>[],
      onTap: (data) {},
      isMultiSelect: true,
      isStatic: true,
      isItemSelectionRequired: false,
      loadingItemsCount: 3,
      loadingItemHeight: 60,
    ),
  ),
);
