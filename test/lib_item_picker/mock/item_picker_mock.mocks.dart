// Mocks generated by Mockito 5.3.2 from annotations
// in widget_toolkit/test/lib_item_picker/mock/item_picker_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:widget_toolkit/src/lib_item_picker/blocs/item_picker_bloc.dart'
    as _i2;
import 'package:rx_bloc/rx_bloc.dart' as _i4;

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

class _FakeItemPickerBlocEvents_0 extends _i1.SmartFake
    implements _i2.ItemPickerBlocEvents {
  _FakeItemPickerBlocEvents_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeItemPickerBlocStates_1<T> extends _i1.SmartFake
    implements _i2.ItemPickerBlocStates<T> {
  _FakeItemPickerBlocStates_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ItemPickerBlocStates].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemPickerBlocStates<T> extends _i1.Mock
    implements _i2.ItemPickerBlocStates<T> {
  MockItemPickerBlocStates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i4.Result<List<T>>> get items => (super.noSuchMethod(
        Invocation.getter(#items),
        returnValue: _i3.Stream<_i4.Result<List<T>>>.empty(),
      ) as _i3.Stream<_i4.Result<List<T>>>);
}

/// A class which mocks [ItemPickerBlocEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemPickerBlocEvents extends _i1.Mock
    implements _i2.ItemPickerBlocEvents {
  MockItemPickerBlocEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void loadItems() => super.noSuchMethod(
        Invocation.method(
          #loadItems,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ItemPickerBlocType].
///
/// See the documentation for Mockito's code generation for more information.
class MockItemPickerBlocType<T> extends _i1.Mock
    implements _i2.ItemPickerBlocType<T> {
  MockItemPickerBlocType() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ItemPickerBlocEvents get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: _FakeItemPickerBlocEvents_0(
          this,
          Invocation.getter(#events),
        ),
      ) as _i2.ItemPickerBlocEvents);
  @override
  _i2.ItemPickerBlocStates<T> get states => (super.noSuchMethod(
        Invocation.getter(#states),
        returnValue: _FakeItemPickerBlocStates_1<T>(
          this,
          Invocation.getter(#states),
        ),
      ) as _i2.ItemPickerBlocStates<T>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
