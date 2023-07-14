// Mocks generated by Mockito 5.4.2 from annotations
// in widget_toolkit_pin/test/lib_pin_code/blocs/pin_code_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart'
    as _i6;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart'
    as _i5;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/repositories/pin_biometrics_repository.dart'
    as _i2;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/services/pin_biometrics_service.dart'
    as _i3;
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/services/pin_code_service.dart'
    as _i7;

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

class _FakePinBiometricsRepository_0 extends _i1.SmartFake
    implements _i2.PinBiometricsRepository {
  _FakePinBiometricsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PinBiometricsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinBiometricsService extends _i1.Mock
    implements _i3.PinBiometricsService {
  MockPinBiometricsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PinBiometricsRepository get biometricAuthenticationRepository =>
      (super.noSuchMethod(
        Invocation.getter(#biometricAuthenticationRepository),
        returnValue: _FakePinBiometricsRepository_0(
          this,
          Invocation.getter(#biometricAuthenticationRepository),
        ),
      ) as _i2.PinBiometricsRepository);
  @override
  set biometricAuthenticationRepository(
          _i2.PinBiometricsRepository? _biometricAuthenticationRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #biometricAuthenticationRepository,
          _biometricAuthenticationRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<List<_i5.BiometricsAuthType>> get availableBiometrics =>
      (super.noSuchMethod(
        Invocation.getter(#availableBiometrics),
        returnValue: _i4.Future<List<_i5.BiometricsAuthType>>.value(
            <_i5.BiometricsAuthType>[]),
      ) as _i4.Future<List<_i5.BiometricsAuthType>>);
  @override
  _i4.Future<bool> get canCheckBiometrics => (super.noSuchMethod(
        Invocation.getter(#canCheckBiometrics),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> get isDeviceSupported => (super.noSuchMethod(
        Invocation.getter(#isDeviceSupported),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> authenticate(String? localizedReason) => (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [localizedReason],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> areBiometricsEnabled() => (super.noSuchMethod(
        Invocation.method(
          #areBiometricsEnabled,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<void> setBiometricsEnabled(bool? areBiometricsEnabled) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBiometricsEnabled,
          [areBiometricsEnabled],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i6.BiometricsMessage?> enableBiometrics(
    bool? value,
    String? localizedReason,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #enableBiometrics,
          [
            value,
            localizedReason,
          ],
        ),
        returnValue: _i4.Future<_i6.BiometricsMessage?>.value(),
      ) as _i4.Future<_i6.BiometricsMessage?>);
}

/// A class which mocks [PinCodeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPinCodeService extends _i1.Mock implements _i7.PinCodeService {
  MockPinCodeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> isPinCodeInSecureStorage() => (super.noSuchMethod(
        Invocation.method(
          #isPinCodeInSecureStorage,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> verifyPinCode(String? pinCode) => (super.noSuchMethod(
        Invocation.method(
          #verifyPinCode,
          [pinCode],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<int> getPinLength() => (super.noSuchMethod(
        Invocation.method(
          #getPinLength,
          [],
        ),
        returnValue: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<String> encryptPinCode(String? pinCode) => (super.noSuchMethod(
        Invocation.method(
          #encryptPinCode,
          [pinCode],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String?> getPinCode() => (super.noSuchMethod(
        Invocation.method(
          #getPinCode,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
}
