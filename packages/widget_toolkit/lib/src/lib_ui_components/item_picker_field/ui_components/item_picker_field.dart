import 'package:flutter/material.dart';

import '../../../../widget_toolkit.dart';
import '../../../base/models/item_builder.dart';

class ItemPickerField<T extends PickerItemModel> extends StatelessWidget {
  const ItemPickerField({
    required this.pickerService,
    this.controller,
    this.textController,
    this.initialValue,
    this.decoration,
    this.pickerItemBuilder,
    this.pickerErrorBuilder,
    this.pickerEmptyBuilder,
    this.pickerSeparatorBuilder,
    this.pickerTitle,
    this.isMultiSelect = false,
    super.key,
  });

  final ItemPickerController<T>? controller;
  final TextEditingController? textController;
  final List<T>? initialValue;
  final InputDecoration? decoration;
  final ItemPickerService<T> pickerService;
  final ItemPickerItemBuilder<T>? pickerItemBuilder;
  final Widget Function(Exception)? pickerErrorBuilder;
  final Widget Function()? pickerEmptyBuilder;
  final Widget Function(BuildContext context, int index)?
      pickerSeparatorBuilder;
  final String? pickerTitle;
  final bool isMultiSelect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onTap: () => onShowPicker(context),
      readOnly: true,
      controller: textController,
      decoration: decoration,
      onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }

  void onShowPicker(BuildContext context) {
    showItemPickerBottomSheet<T>(
      context: context,
      service: pickerService,
      title: pickerTitle,
      callback: (values) {
        controller?.setValues(values);
      },
      itemBuilder: pickerItemBuilder,
      separatorBuilder: pickerSeparatorBuilder,
      emptyBuilder: pickerEmptyBuilder,
      errorBuilder: pickerErrorBuilder,
      selectedItems: controller?.value,
      configuration: ItemPickerConfiguration(
        isMultiSelect: isMultiSelect,
      ),
      modalConfiguration: ItemPickerModalConfiguration(
        showCloseButton: false,
        safeAreaBottom: true,
        heightFactor: 0.7,
      ),
    );
  }
}
