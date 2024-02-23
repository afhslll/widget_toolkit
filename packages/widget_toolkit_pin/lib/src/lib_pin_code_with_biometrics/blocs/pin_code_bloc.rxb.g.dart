// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'pin_code_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class PinCodeBlocType extends RxBlocTypeBase {
  PinCodeBlocEvents get events;
  PinCodeBlocStates get states;
}

/// [$PinCodeBloc] extended by the [PinCodeBloc]
/// @nodoc
abstract class $PinCodeBloc extends RxBlocBase
    implements PinCodeBlocEvents, PinCodeBlocStates, PinCodeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [addDigit]
  final _$addDigitEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [deleteDigit]
  final _$deleteDigitEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [biometricsButtonPressed]
  final _$biometricsButtonPressedEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [checkIfPinIsStored]
  final _$checkIfPinIsStoredEvent = PublishSubject<void>();

  /// The state of [digitsCount] implemented in [_mapToDigitsCountState]
  late final Stream<int> _digitsCountState = _mapToDigitsCountState();

  /// The state of [showBiometricsButton] implemented in
  /// [_mapToShowBiometricsButtonState]
  late final ConnectableStream<bool> _showBiometricsButtonState =
      _mapToShowBiometricsButtonState();

  /// The state of [authenticated] implemented in [_mapToAuthenticatedState]
  late final ConnectableStream<void> _authenticatedState =
      _mapToAuthenticatedState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  @override
  void addDigit(String digit) => _$addDigitEvent.add(digit);

  @override
  void deleteDigit() => _$deleteDigitEvent.add(null);

  @override
  void biometricsButtonPressed() => _$biometricsButtonPressedEvent.add(null);

  @override
  void checkIfPinIsStored() => _$checkIfPinIsStoredEvent.add(null);

  @override
  Stream<int> get digitsCount => _digitsCountState;

  @override
  ConnectableStream<bool> get showBiometricsButton =>
      _showBiometricsButtonState;

  @override
  ConnectableStream<void> get authenticated => _authenticatedState;

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  Stream<int> _mapToDigitsCountState();

  ConnectableStream<bool> _mapToShowBiometricsButtonState();

  ConnectableStream<void> _mapToAuthenticatedState();

  Stream<bool> _mapToIsLoadingState();

  Stream<ErrorModel> _mapToErrorsState();

  @override
  PinCodeBlocEvents get events => this;

  @override
  PinCodeBlocStates get states => this;

  @override
  void dispose() {
    _$addDigitEvent.close();
    _$deleteDigitEvent.close();
    _$biometricsButtonPressedEvent.close();
    _$checkIfPinIsStoredEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
