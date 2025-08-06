import 'package:flutter/material.dart';

import '../../../../models.dart';

class ItemPickerController<T extends PickerItemModel>
    extends ValueNotifier<List<T>> {
  ItemPickerController({List<T>? initialValue}) : super(initialValue ?? []);

  void setValues(List<PickerItemModel> newValues) {
    value = newValues.whereType<T>().toList();
  }
}
