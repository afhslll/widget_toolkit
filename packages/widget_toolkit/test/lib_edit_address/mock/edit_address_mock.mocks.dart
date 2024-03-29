// Mocks generated by Mockito 5.4.4 from annotations
// in widget_toolkit/test/lib_edit_address/mock/edit_address_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/rxdart.dart' as _i2;
import 'package:widget_toolkit/language_picker.dart' as _i6;
import 'package:widget_toolkit/src/lib_edit_address/blocs/edit_address_bloc.dart'
    as _i3;
import 'package:widget_toolkit/src/lib_edit_address/models/address_model.dart'
    as _i5;
import 'package:widget_toolkit/src/lib_edit_address/models/country_model.dart'
    as _i7;

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

class _FakeEditAddressBlocEvents_1 extends _i1.SmartFake
    implements _i3.EditAddressBlocEvents {
  _FakeEditAddressBlocEvents_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEditAddressBlocStates_2 extends _i1.SmartFake
    implements _i3.EditAddressBlocStates {
  _FakeEditAddressBlocStates_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EditAddressBlocStates].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditAddressBlocStates extends _i1.Mock
    implements _i3.EditAddressBlocStates {
  MockEditAddressBlocStates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.AddressModel> get onAddressSet => (super.noSuchMethod(
        Invocation.getter(#onAddressSet),
        returnValue: _i4.Stream<_i5.AddressModel>.empty(),
      ) as _i4.Stream<_i5.AddressModel>);

  @override
  _i4.Stream<bool> get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: _i4.Stream<bool>.empty(),
      ) as _i4.Stream<bool>);

  @override
  _i2.ConnectableStream<_i6.ErrorModel?> get errors => (super.noSuchMethod(
        Invocation.getter(#errors),
        returnValue: _FakeConnectableStream_0<_i6.ErrorModel?>(
          this,
          Invocation.getter(#errors),
        ),
      ) as _i2.ConnectableStream<_i6.ErrorModel?>);

  @override
  _i2.ConnectableStream<_i5.AddressModel> get onAddressSaved =>
      (super.noSuchMethod(
        Invocation.getter(#onAddressSaved),
        returnValue: _FakeConnectableStream_0<_i5.AddressModel>(
          this,
          Invocation.getter(#onAddressSaved),
        ),
      ) as _i2.ConnectableStream<_i5.AddressModel>);

  @override
  _i2.ConnectableStream<String> get street => (super.noSuchMethod(
        Invocation.getter(#street),
        returnValue: _FakeConnectableStream_0<String>(
          this,
          Invocation.getter(#street),
        ),
      ) as _i2.ConnectableStream<String>);

  @override
  _i2.ConnectableStream<String> get city => (super.noSuchMethod(
        Invocation.getter(#city),
        returnValue: _FakeConnectableStream_0<String>(
          this,
          Invocation.getter(#city),
        ),
      ) as _i2.ConnectableStream<String>);

  @override
  _i2.ConnectableStream<bool> get isCountryEdited => (super.noSuchMethod(
        Invocation.getter(#isCountryEdited),
        returnValue: _FakeConnectableStream_0<bool>(
          this,
          Invocation.getter(#isCountryEdited),
        ),
      ) as _i2.ConnectableStream<bool>);

  @override
  _i2.ConnectableStream<_i7.CountryModel> get country => (super.noSuchMethod(
        Invocation.getter(#country),
        returnValue: _FakeConnectableStream_0<_i7.CountryModel>(
          this,
          Invocation.getter(#country),
        ),
      ) as _i2.ConnectableStream<_i7.CountryModel>);

  @override
  _i2.ConnectableStream<_i5.AddressModel> get address => (super.noSuchMethod(
        Invocation.getter(#address),
        returnValue: _FakeConnectableStream_0<_i5.AddressModel>(
          this,
          Invocation.getter(#address),
        ),
      ) as _i2.ConnectableStream<_i5.AddressModel>);
}

/// A class which mocks [EditAddressBlocEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditAddressBlocEvents extends _i1.Mock
    implements _i3.EditAddressBlocEvents {
  MockEditAddressBlocEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void setAddress(_i5.AddressModel? addressModel) => super.noSuchMethod(
        Invocation.method(
          #setAddress,
          [addressModel],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void saveAddress() => super.noSuchMethod(
        Invocation.method(
          #saveAddress,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStreet(String? newStreet) => super.noSuchMethod(
        Invocation.method(
          #setStreet,
          [newStreet],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setCity(String? newCity) => super.noSuchMethod(
        Invocation.method(
          #setCity,
          [newCity],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setCountry(_i7.CountryModel? newCountry) => super.noSuchMethod(
        Invocation.method(
          #setCountry,
          [newCountry],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void saveCountry() => super.noSuchMethod(
        Invocation.method(
          #saveCountry,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [EditAddressBlocType].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditAddressBlocType extends _i1.Mock
    implements _i3.EditAddressBlocType {
  MockEditAddressBlocType() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.EditAddressBlocEvents get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: _FakeEditAddressBlocEvents_1(
          this,
          Invocation.getter(#events),
        ),
      ) as _i3.EditAddressBlocEvents);

  @override
  _i3.EditAddressBlocStates get states => (super.noSuchMethod(
        Invocation.getter(#states),
        returnValue: _FakeEditAddressBlocStates_2(
          this,
          Invocation.getter(#states),
        ),
      ) as _i3.EditAddressBlocStates);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
