// Mocks generated by Mockito 5.4.2 from annotations
// in widget_toolkit/test/lib_item_picker/blocs/item_picker_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;

import '../models/item_picker_data_mock.dart' as _i3;
import '../services/item_picker_service_mock.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ItemPickerServiceMock].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemPickerServiceMock extends _i1.Mock
    implements _i2.ItemPickerServiceMock {
  MockItemPickerServiceMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.ItemPickerDataMock> get data => (super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: <_i3.ItemPickerDataMock>[],
      ) as List<_i3.ItemPickerDataMock>);
  @override
  _i4.Future<List<_i3.ItemPickerDataMock>> getItems() => (super.noSuchMethod(
        Invocation.method(
          #getItems,
          [],
        ),
        returnValue: _i4.Future<List<_i3.ItemPickerDataMock>>.value(
            <_i3.ItemPickerDataMock>[]),
      ) as _i4.Future<List<_i3.ItemPickerDataMock>>);
}
