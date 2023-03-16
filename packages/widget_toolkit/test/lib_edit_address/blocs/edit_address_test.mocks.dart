// Mocks generated by Mockito 5.3.2 from annotations
// in widget_toolkit/test/lib_edit_address/blocs/edit_address_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:widget_toolkit/src/lib_edit_address/models/address_model.dart'
    as _i2;
import 'package:widget_toolkit/src/lib_edit_address/models/address_type_model.dart'
    as _i6;
import 'package:widget_toolkit/src/lib_edit_address/models/country_model.dart'
    as _i3;
import 'package:widget_toolkit/src/lib_edit_address/services/edit_address_service.dart'
    as _i4;

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

class _FakeAddressModel_0 extends _i1.SmartFake implements _i2.AddressModel {
  _FakeAddressModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCountryModel_1 extends _i1.SmartFake implements _i3.CountryModel {
  _FakeCountryModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EditAddressService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditAddressService<T> extends _i1.Mock
    implements _i4.EditAddressService<T> {
  MockEditAddressService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.AddressModel> saveAddress(_i2.AddressModel? addressModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveAddress,
          [addressModel],
        ),
        returnValue: _i5.Future<_i2.AddressModel>.value(_FakeAddressModel_0(
          this,
          Invocation.method(
            #saveAddress,
            [addressModel],
          ),
        )),
      ) as _i5.Future<_i2.AddressModel>);
  @override
  _i5.Future<List<T>> getCountries() => (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [],
        ),
        returnValue: _i5.Future<List<T>>.value(<T>[]),
      ) as _i5.Future<List<T>>);
  @override
  List<T> getCountryPlaceholderList() => (super.noSuchMethod(
        Invocation.method(
          #getCountryPlaceholderList,
          [],
        ),
        returnValue: <T>[],
      ) as List<T>);
  @override
  _i5.Future<List<T>> filteredCountriesByName(
    List<T>? list,
    String? searchParam,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #filteredCountriesByName,
          [
            list,
            searchParam,
          ],
        ),
        returnValue: _i5.Future<List<T>>.value(<T>[]),
      ) as _i5.Future<List<T>>);
  @override
  _i5.Future<String> validateCityOnSubmit(String? text) => (super.noSuchMethod(
        Invocation.method(
          #validateCityOnSubmit,
          [text],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<String> validateStreetOnSubmit(String? text) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateStreetOnSubmit,
          [text],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  void validateCityOnType(String? text) => super.noSuchMethod(
        Invocation.method(
          #validateCityOnType,
          [text],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void validateStreetOnType(String? text) => super.noSuchMethod(
        Invocation.method(
          #validateStreetOnType,
          [text],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AddressModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddressModel extends _i1.Mock implements _i2.AddressModel {
  MockAddressModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.AddressTypeModel get addressType => (super.noSuchMethod(
        Invocation.getter(#addressType),
        returnValue: _i6.AddressTypeModel.headquarters,
      ) as _i6.AddressTypeModel);
  @override
  String get city => (super.noSuchMethod(
        Invocation.getter(#city),
        returnValue: '',
      ) as String);
  @override
  String get streetAddress => (super.noSuchMethod(
        Invocation.getter(#streetAddress),
        returnValue: '',
      ) as String);
  @override
  _i3.CountryModel get country => (super.noSuchMethod(
        Invocation.getter(#country),
        returnValue: _FakeCountryModel_1(
          this,
          Invocation.getter(#country),
        ),
      ) as _i3.CountryModel);
  @override
  String get fullAddress => (super.noSuchMethod(
        Invocation.getter(#fullAddress),
        returnValue: '',
      ) as String);
  @override
  String get countryAndCity => (super.noSuchMethod(
        Invocation.getter(#countryAndCity),
        returnValue: '',
      ) as String);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
  @override
  bool isEmpty() => (super.noSuchMethod(
        Invocation.method(
          #isEmpty,
          [],
        ),
        returnValue: false,
      ) as bool);
}
