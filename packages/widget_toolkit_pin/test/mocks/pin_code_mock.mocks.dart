// Mocks generated by Mockito 5.4.4 from annotations
// in widget_toolkit_pin/test/mocks/pin_code_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/rxdart.dart' as _i2;
import 'package:widget_toolkit/models.dart' as _i5;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/blocs/pin_code_bloc.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeConnectableStream_0<T> extends _i1.SmartFake
    implements _i2.ConnectableStream<T> {
  _FakeConnectableStream_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePinCodeBlocEvents_1 extends _i1.SmartFake
    implements _i3.PinCodeBlocEvents {
  _FakePinCodeBlocEvents_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePinCodeBlocStates_2 extends _i1.SmartFake
    implements _i3.PinCodeBlocStates {
  _FakePinCodeBlocStates_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PinCodeBlocStates].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinCodeBlocStates extends _i1.Mock implements _i3.PinCodeBlocStates {
  MockPinCodeBlocStates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<int> get digitsCount => (super.noSuchMethod(
        Invocation.getter(#digitsCount),
        returnValue: _i4.Stream<int>.empty(),
      ) as _i4.Stream<int>);

  @override
  _i2.ConnectableStream<bool> get showBiometricsButton => (super.noSuchMethod(
        Invocation.getter(#showBiometricsButton),
        returnValue: _FakeConnectableStream_0<bool>(
          this,
          Invocation.getter(#showBiometricsButton),
        ),
      ) as _i2.ConnectableStream<bool>);

  @override
  _i2.ConnectableStream<void> get authenticated => (super.noSuchMethod(
        Invocation.getter(#authenticated),
        returnValue: _FakeConnectableStream_0<void>(
          this,
          Invocation.getter(#authenticated),
        ),
      ) as _i2.ConnectableStream<void>);

  @override
  _i4.Stream<bool> get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: _i4.Stream<bool>.empty(),
      ) as _i4.Stream<bool>);

  @override
  _i4.Stream<_i5.ErrorModel> get errors => (super.noSuchMethod(
        Invocation.getter(#errors),
        returnValue: _i4.Stream<_i5.ErrorModel>.empty(),
      ) as _i4.Stream<_i5.ErrorModel>);
}

/// A class which mocks [PinCodeBlocEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinCodeBlocEvents extends _i1.Mock implements _i3.PinCodeBlocEvents {
  MockPinCodeBlocEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addDigit(String? digit) => super.noSuchMethod(
        Invocation.method(
          #addDigit,
          [digit],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deleteDigit() => super.noSuchMethod(
        Invocation.method(
          #deleteDigit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void biometricsButtonPressed() => super.noSuchMethod(
        Invocation.method(
          #biometricsButtonPressed,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void checkIfPinIsStored() => super.noSuchMethod(
        Invocation.method(
          #checkIfPinIsStored,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [PinCodeBlocType].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinCodeBlocType extends _i1.Mock implements _i3.PinCodeBlocType {
  MockPinCodeBlocType() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.PinCodeBlocEvents get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: _FakePinCodeBlocEvents_1(
          this,
          Invocation.getter(#events),
        ),
      ) as _i3.PinCodeBlocEvents);

  @override
  _i3.PinCodeBlocStates get states => (super.noSuchMethod(
        Invocation.getter(#states),
        returnValue: _FakePinCodeBlocStates_2(
          this,
          Invocation.getter(#states),
        ),
      ) as _i3.PinCodeBlocStates);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
