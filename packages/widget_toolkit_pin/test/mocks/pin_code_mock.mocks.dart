// Mocks generated by Mockito 5.3.2 from annotations
// in widget_toolkit_pin/test/mocks/pin_code_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/rxdart.dart' as _i2;
import 'package:widget_toolkit/models.dart' as _i7;
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart'
    as _i6;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/blocs/pin_code_bloc.dart'
    as _i3;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart'
    as _i5;

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
  _i4.Stream<bool> get areBiometricsEnabled => (super.noSuchMethod(
        Invocation.getter(#areBiometricsEnabled),
        returnValue: _i4.Stream<bool>.empty(),
      ) as _i4.Stream<bool>);
  @override
  _i2.ConnectableStream<bool> get isPinCodeVerified => (super.noSuchMethod(
        Invocation.getter(#isPinCodeVerified),
        returnValue: _FakeConnectableStream_0<bool>(
          this,
          Invocation.getter(#isPinCodeVerified),
        ),
      ) as _i2.ConnectableStream<bool>);
  @override
  _i2.ConnectableStream<List<_i5.BiometricsAuthType>> get availableBiometrics =>
      (super.noSuchMethod(
        Invocation.getter(#availableBiometrics),
        returnValue: _FakeConnectableStream_0<List<_i5.BiometricsAuthType>>(
          this,
          Invocation.getter(#availableBiometrics),
        ),
      ) as _i2.ConnectableStream<List<_i5.BiometricsAuthType>>);
  @override
  _i2.ConnectableStream<bool> get isAuthenticatedWithBiometrics =>
      (super.noSuchMethod(
        Invocation.getter(#isAuthenticatedWithBiometrics),
        returnValue: _FakeConnectableStream_0<bool>(
          this,
          Invocation.getter(#isAuthenticatedWithBiometrics),
        ),
      ) as _i2.ConnectableStream<bool>);
  @override
  _i4.Stream<_i6.BiometricsMessage?> get biometricsDialog =>
      (super.noSuchMethod(
        Invocation.getter(#biometricsDialog),
        returnValue: _i4.Stream<_i6.BiometricsMessage?>.empty(),
      ) as _i4.Stream<_i6.BiometricsMessage?>);
  @override
  _i2.ConnectableStream<bool> get isPinCodeInSecureStorage =>
      (super.noSuchMethod(
        Invocation.getter(#isPinCodeInSecureStorage),
        returnValue: _FakeConnectableStream_0<bool>(
          this,
          Invocation.getter(#isPinCodeInSecureStorage),
        ),
      ) as _i2.ConnectableStream<bool>);
  @override
  _i2.ConnectableStream<int> get pinLength => (super.noSuchMethod(
        Invocation.getter(#pinLength),
        returnValue: _FakeConnectableStream_0<int>(
          this,
          Invocation.getter(#pinLength),
        ),
      ) as _i2.ConnectableStream<int>);
  @override
  _i4.Stream<bool> get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: _i4.Stream<bool>.empty(),
      ) as _i4.Stream<bool>);
  @override
  _i4.Stream<_i7.ErrorModel> get errors => (super.noSuchMethod(
        Invocation.getter(#errors),
        returnValue: _i4.Stream<_i7.ErrorModel>.empty(),
      ) as _i4.Stream<_i7.ErrorModel>);
}

/// A class which mocks [PinCodeBlocEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinCodeBlocEvents extends _i1.Mock implements _i3.PinCodeBlocEvents {
  MockPinCodeBlocEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void getPinLength(int? length) => super.noSuchMethod(
        Invocation.method(
          #getPinLength,
          [length],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void checkBiometricsEnabled() => super.noSuchMethod(
        Invocation.method(
          #checkBiometricsEnabled,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void checkAvailableBiometrics() => super.noSuchMethod(
        Invocation.method(
          #checkAvailableBiometrics,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void checkPinCodeInStorage() => super.noSuchMethod(
        Invocation.method(
          #checkPinCodeInStorage,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void requestBiometricAuth(String? localizedMessage) => super.noSuchMethod(
        Invocation.method(
          #requestBiometricAuth,
          [localizedMessage],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void autoSubmit(String? pin) => super.noSuchMethod(
        Invocation.method(
          #autoSubmit,
          [pin],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setBiometrics(
    bool? enabled,
    String? localizedReason,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setBiometrics,
          [
            enabled,
            localizedReason,
          ],
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
